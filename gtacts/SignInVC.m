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

    self.signInDelegate = self.parentViewController;

    GIDSignIn *googleSignIn = [GIDSignIn sharedInstance];

    googleSignIn.delegate = self;
    googleSignIn.allowsSignInWithWebView = NO;
    
    [googleSignIn signIn];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    NSAssert( !error, @"Error on Google signin: %@", error);
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    [self.signInDelegate didCompleteGoogleSignIn];
}

@end
