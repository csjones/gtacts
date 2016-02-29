//
//  LaunchContainer.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "LaunchContainer.h"
#import "ContactsTableVC.h"

@implementation LaunchContainer

- (void)didCompleteGoogleSignIn
{
    ContactsTableVC *contactsTableVC = self.childViewControllers[0];

    [contactsTableVC shouldBeginFetchingContactData];
}

@end
