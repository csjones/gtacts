//
//  SignInVC.h
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

#import "SignInDelegate.h"

@interface SignInVC : UIViewController <GIDSignInDelegate, GIDSignInUIDelegate>

@property ( weak, nonatomic, nullable ) id<SignInDelegate> signInDelegate;

@end
