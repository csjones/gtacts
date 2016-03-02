//
//  ContactsTableVC.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "ContactsTableVC.h"

@implementation ContactsTableVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _userContacts = [[GoogleUserContacts alloc] init];

    _userContacts.updateContactsDelegate = self;

    self.tableView.dataSource = _userContacts;
}

- (void)shouldBeginFetchingContactData {
    [_userContacts getMoreContacts];
}

- (void)didAddContactsToSection:(NSUInteger)section {
    [self.tableView insertSections:[[NSIndexSet alloc] initWithIndex:section]
                  withRowAnimation:UITableViewRowAnimationTop];
}

@end
