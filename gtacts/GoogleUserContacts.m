//
//  GoogleUserContacts.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "GoogleUserContacts.h"

@implementation GoogleUserContacts

- (id)init {
    if (self = [super init]) {
        _contactsRequester = [[ContactsRequester alloc] init];

        _contactsRequester.contactsRequesterDelegate = self;

        [_contactsRequester fetchContactsForLastNameStartingWith:@"B"];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)didFetchContacts:(NSArray*)contacts forLastName:(NSString*)lastName {
    NSLog(@"contacts %@", contacts);
}

@end
