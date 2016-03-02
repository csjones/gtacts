//
//  GoogleUserContacts.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "GoogleUserContacts.h"
#import "UIImageView+AFNetworking.h"

@implementation GoogleUserContacts

- (id)init {
    if (self = [super init]) {
        _contacts = [[NSMutableDictionary alloc] init];

        _contactsRequester = [[ContactsRequester alloc] init];

        _contactsRequester.contactsRequesterDelegate = self;

        _alphabet = @[ @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",
                       @"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z" ];

        _counter = 0;
    }
    return self;
}

- (void)getMoreContacts {
    if (_counter == _alphabet.count) {
        return;
    }

    [_contactsRequester fetchContactsForLastNameStartingWith:_alphabet[ _counter ]];

    if (_counter < _alphabet.count) {
        _counter++;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _contacts.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sortedArray = [_contacts.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    NSArray *sectionOfContacts = _contacts[ sortedArray[ section ] ];

    return sectionOfContacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sortedArray = [_contacts.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    NSDictionary *contact = _contacts[ sortedArray[ indexPath.section ] ][ indexPath.row ];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.textLabel.text = contact[@"name"];
    cell.detailTextLabel.text = contact[@"email"];

    NSString *stringURL = [[NSString alloc] initWithFormat:@"%@?v=3&access_token=%@", contact[@"image"], [GIDSignIn sharedInstance].currentUser.authentication.accessToken];

    [cell.imageView setImageWithURL:[[NSURL alloc] initWithString:stringURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];

    return cell;
}

- (void)didFetchContacts:(NSArray*)contacts forLastName:(NSString*)lastName {
    _contacts[lastName] = contacts;

    [self.updateContactsDelegate didAddContactsToSection:_contacts.allKeys.count - 1];
}

@end
