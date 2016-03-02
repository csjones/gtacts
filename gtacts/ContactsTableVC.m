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

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
        __weak GoogleUserContacts *weakUserContacts = _userContacts;

        dispatch_once(&_pred, ^{
            [weakUserContacts getMoreContacts];
        });
    }
}

- (void)shouldBeginFetchingContactData {
    [_userContacts getMoreContacts];
}

- (void)didAddContactsToSection:(NSUInteger)section {
    [self.tableView insertSections:[[NSIndexSet alloc] initWithIndex:section]
                      withRowAnimation:UITableViewRowAnimationTop];

    CGRect sectionRect = [self.tableView rectForSection:section];

    CGFloat tableViewHeight = self.tableView.frame.size.height;

    CGFloat verticalOffset = self.tableView.contentOffset.y;

    if ((tableViewHeight + verticalOffset) >= (sectionRect.size.height + sectionRect.origin.y)) {
        [_userContacts getMoreContacts];
    }
    else {
        _pred = 0;
    }
}

@end
