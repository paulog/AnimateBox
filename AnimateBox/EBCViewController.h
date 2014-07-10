//
//  EBCViewController.h
//  AnimateBox
//
//  Created by Paulo Gonzaga on 7/9/14.
//  Copyright (c) 2014 Eight Bit Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBCViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *bgRectangle;

- (IBAction)buttonPressed:(id)sender;

@end
