//
//  ContactsRequester.m
//  gtacts
//
//  Created by Chris on 2/29/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "ContactsRequester.h"

@interface ContactsRequester ()

- (void(^)(NSURLResponse * _Nonnull, id  _Nullable, NSError * _Nullable))handleResponseForPrefix:(NSString*)prefix;

@end

@implementation ContactsRequester

- (id)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

        _sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];

        _url = @"https://www.google.com/m8/feeds/contacts/default/full";
    }
    return self;
}

- (void)fetchContactsForLastNameStartingWith:(NSString*)prefix {
    NSDictionary *param = @{@"access_token" : [GIDSignIn sharedInstance].currentUser.authentication.accessToken,
                            @"alt":@"json", @"max-results" : @1000, @"q" : prefix};

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:_url parameters:param error:nil];

    [request setValue:@"3.0" forHTTPHeaderField:@"GData-Version"];

    NSURLSessionDataTask *dataTask;

    dataTask = [_sessionManager dataTaskWithRequest:request completionHandler:[self handleResponseForPrefix:prefix]];

    [dataTask resume];
}

- (void(^)(NSURLResponse * _Nonnull, id  _Nullable, NSError * _Nullable))handleResponseForPrefix:(NSString*)prefix {
    __weak ContactsRequester *weakSelf = self;

    return ^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSArray *entries = responseObject[@"feed"][@"entry"];

        NSMutableArray *matchingContacts = [[NSMutableArray alloc] init];

        for (NSDictionary *entry in entries) {
            if ([entry[@"gd$name"][@"gd$familyName"][@"$t"] hasPrefix:[prefix lowercaseString]] ||
                [entry[@"gd$name"][@"gd$familyName"][@"$t"] hasPrefix:[prefix capitalizedString]]) {

                [matchingContacts addObject:@{ @"name" : entry[@"title"][@"$t"],
                                               @"email" : entry[@"gd$email"][0][@"address"],
                                               @"image" : entry[@"link"][0][@"href"] }];
            }
        }

        [weakSelf.contactsRequesterDelegate didFetchContacts:[[NSArray alloc] initWithArray:matchingContacts]
                                                 forLastName:prefix];
    };
}

@end
