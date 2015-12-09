//
//  DetailViewController.h
//  ViewHunter
//
//  Created by Samhan Salahuddin on 07/10/15.
//  Copyright © 2015 Samhan Salahuddin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

