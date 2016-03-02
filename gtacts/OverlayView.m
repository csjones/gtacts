//
//  OverlayView.m
//  gtacts
//
//  Created by Chris on 3/1/16.
//  Copyright © 2016 csjones. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitTestView = [super hitTest:point withEvent:event];

    if (hitTestView == self) {
        hitTestView = nil;
    }
    
    return hitTestView;
}

@end
