//
//  ContactsTableVC.h
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GoogleUserContacts.h"

@interface ContactsTableVC : UITableViewController
{
    GoogleUserContacts *_userContacts;
}

- (void)shouldBeginFetchingContactData;

@end
