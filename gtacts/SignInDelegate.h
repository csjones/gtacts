//
//  SignInDelegate.h
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SignInDelegate <NSObject>

- (void)didCompleteGoogleSignIn;

@end
