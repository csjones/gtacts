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
        _contacts = [[NSMutableDictionary alloc] init];

        _contactsRequester = [[ContactsRequester alloc] init];

        _contactsRequester.contactsRequesterDelegate = self;

        [_contactsRequester fetchContactsForLastNameStartingWith:@"A"];
    }
    return self;
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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.textLabel.text = contact[@"name"];
    cell.detailTextLabel.text = contact[@"email"];

    return nil;
}

- (void)didFetchContacts:(NSArray*)contacts forLastName:(NSString*)lastName {
    _contacts[lastName] = contacts;

    [self.updateContactsDelegate didAddContactsToSection:_contacts.allKeys.count - 1];
}

@end
