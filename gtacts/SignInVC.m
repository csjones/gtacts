//
//  SignInVC.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "SignInVC.h"
#import "LaunchContainer.h"

@implementation SignInVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.signInDelegate = (LaunchContainer*)self.parentViewController;

    GIDSignIn *googleSignIn = [GIDSignIn sharedInstance];

    NSArray *currentScopes = googleSignIn.scopes;

    googleSignIn.delegate = self;
    googleSignIn.uiDelegate = self;
    googleSignIn.scopes = [currentScopes arrayByAddingObject:@"https://www.googleapis.com/auth/contacts.readonly"];

    [googleSignIn signIn];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    NSAssert( !error, @"Error on Google signin: %@", error);
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    [self.signInDelegate didCompleteGoogleSignIn];
}

@end
