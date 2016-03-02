//
//  UpdateContactsDelegate.h
//  gtacts
//
//  Created by Chris on 3/1/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UpdateContactsDelegate <NSObject>

- (void)didAddContactsToSection:(NSUInteger)section;

@end
