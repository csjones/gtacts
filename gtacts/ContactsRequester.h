//
//  ContactsRequester.h
//  gtacts
//
//  Created by Chris on 2/29/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Google/SignIn.h>
#import <UIKit/UIKit.h>

#import "AFNetworking.h"
#import "ContactsRequesterDelegate.h"

@interface ContactsRequester : NSObject
{
    AFURLSessionManager *_sessionManager;

    NSString *_url;
}

@property ( weak, nonatomic ) id<ContactsRequesterDelegate> contactsRequesterDelegate;

- (void)fetchContactsForLastNameStartingWith:(NSString*)prefix;

@end
