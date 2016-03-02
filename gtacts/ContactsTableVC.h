//
//  ContactsTableVC.h
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GoogleUserContacts.h"
#import "UpdateContactsDelegate.h"

@interface ContactsTableVC : UITableViewController <UpdateContactsDelegate>
{
    GoogleUserContacts *_userContacts;

    dispatch_once_t _pred;
}

- (void)shouldBeginFetchingContactData;

@end
