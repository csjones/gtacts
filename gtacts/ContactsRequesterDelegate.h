//
//  ContactsRequesterDelegate.h
//  gtacts
//
//  Created by Chris on 2/29/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContactsRequesterDelegate <NSObject>

- (void)didFetchContacts:(NSArray*)contacts forLastName:(NSString*)lastName;

@end
