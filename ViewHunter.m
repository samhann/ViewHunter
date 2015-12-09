//
//  ViewHunter.m
//  ViewHunter
//
//  Created by Samhan Salahuddin on 07/10/15.
//  Copyright © 2015 Samhan Salahuddin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewHunter.h"
#import "AppDelegate.h"


@interface UIStoryboard (PrivateAPI)

-(NSString*)storyboardFileName;

@end


@implementation ViewHunter

+ (instancetype)sharedType
{
    static ViewHunter *sharedInstance = nil;
    
    if (!sharedInstance) {
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

- (void)installGestureRecognizerInWindow
{
    UILongPressGestureRecognizer *recog = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    
    [recog setDelegate:self];

    
    [[[[UIApplication sharedApplication] delegate] window] addGestureRecognizer:recog];
}



- (NSString*)storyBoardFileNameForViewController:(UIViewController*)vc
{
    if ([vc respondsToSelector:@selector(storyboard)]) {
        
        UIStoryboard *storyboard = [vc storyboard];
        
        if (storyboard) {
            
            return [storyboard storyboardFileName];
        }
    }
    
    
    return @"Unknown";
}

- (void)tapped:(UILongPressGestureRecognizer*)sender
{
    CGPoint tap = [sender locationInView:[[[UIApplication sharedApplication] delegate] window]];
    
    UIView *innerMostView = [[[[UIApplication sharedApplication] delegate] window] hitTest:tap withEvent:nil];
    
    
    NSString * innerMostClass = NSStringFromClass([innerMostView class]);
    
    UIResponder *responder = innerMostView;
    
    while ([responder nextResponder] != nil) {
        
        if ([responder isKindOfClass:[UIViewController class]]) {
        
            
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Found" message:[NSString stringWithFormat:@"View Controller Class - %@ , View Class - %@ Storyboard name - %@ ",NSStringFromClass([responder class]),NSStringFromClass([innerMostView class]), [self storyBoardFileNameForViewController:responder]] preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [controller dismissViewControllerAnimated:YES completion:nil];
                                     self.showingAlert = false;
                                 }];
            
            [controller addAction:ok];
            
            
            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            UIViewController *top = [delegate topViewController];

            if (!self.showingAlert) {
                 [top presentViewController:controller animated:YES completion:nil];
                
                self.showingAlert = true;

            }
           
            
            break;
        }
        
        responder = [responder nextResponder];
        
    }
    
    
                      
    
}


@end
