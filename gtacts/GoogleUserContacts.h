//
//  GoogleUserContacts.h
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Google/SignIn.h>
#import <UIKit/UIKit.h>

#import "ContactsRequesterDelegate.h"

@interface GoogleUserContacts : NSObject <UITableViewDataSource, ContactsRequesterDelegate>
{
}

@end
