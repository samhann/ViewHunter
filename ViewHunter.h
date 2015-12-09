//
//  ViewHunter.h
//  ViewHunter
//
//  Created by Samhan Salahuddin on 07/10/15.
//  Copyright © 2015 Samhan Salahuddin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewHunter : NSObject<UIGestureRecognizerDelegate>

@property (assign,atomic) BOOL showingAlert;

+ (instancetype)sharedType;
- (void)installGestureRecognizerInWindow;

@end
