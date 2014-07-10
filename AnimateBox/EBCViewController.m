//
//  EBCViewController.m
//  AnimateBox
//
//  Created by Paulo Gonzaga on 7/9/14.
//  Copyright (c) 2014 Eight Bit Coder. All rights reserved.
//

#import "EBCViewController.h"
#import <UIKit/UIKit.h>

@interface EBCViewController ()

@end

@implementation EBCViewController {
    NSMutableArray *prompts;
    int promptsLeft;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    prompts = [[NSMutableArray alloc] init];
    
    NSArray *promptText = [[NSArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five",@"Six",@"Seven",@"Eight", nil];
    
    for (int i = 0; i < promptText.count; i++) {
        CGRect promptBox = CGRectMake(40 + i * 250.0, 0.0, 250.0 - 10.0, 220.0);
        
        UILabel *promptLabel = [[UILabel alloc] initWithFrame:promptBox];
        promptLabel.text = [promptText objectAtIndex:i];
        promptLabel.textColor = [UIColor whiteColor];
        promptLabel.backgroundColor = [UIColor blackColor];
        promptLabel.textAlignment = NSTextAlignmentCenter;
        
        [_bgRectangle addSubview:promptLabel];
        [prompts addObject:promptLabel];
    }
    
    promptsLeft = prompts.count - 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    if (promptsLeft > 0) {
    
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             for (int i = 0; i < prompts.count; i++) {
                                 CGPoint newloc;
                                 newloc.x = ((UIView *)[prompts objectAtIndex:i]).center.x - ((UIView *)[prompts objectAtIndex:i]).bounds.size.width - 10.0;
                                 newloc.y = ((UIView *)[prompts objectAtIndex:i]).center.y;
                                 ((UIView *)[prompts objectAtIndex:i]).center = newloc;                         }
                         }
                         completion:^(BOOL finished){
                             NSLog(@"%f",((UIView *)[prompts objectAtIndex:3]).center.x);
                         }];
        
        promptsLeft--;
        
        if (promptsLeft == 0) {
            [_button setEnabled:NO];
        }

    }
}

@end
