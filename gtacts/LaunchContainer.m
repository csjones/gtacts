//
//  LaunchContainer.m
//  gtacts
//
//  Created by Chris on 2/28/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "LaunchContainer.h"

@implementation LaunchContainer

- (void)viewDidLoad {
    [super viewDidLoad];

    [GIDSignIn sharedInstance].delegate = self;
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
}

@end
