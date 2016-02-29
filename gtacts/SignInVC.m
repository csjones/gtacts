//
//  SignInVC.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "SignInVC.h"

@implementation SignInVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [GIDSignIn sharedInstance].allowsSignInWithWebView = NO;
    [[GIDSignIn sharedInstance] signIn];
}

@end
