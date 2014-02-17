//
//  ViewController.h
//  web_tutorial
//
//  Created by GABRIEL VIEIRA on 13/02/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)btn:(id)sender;

- (void) hideKeyboard:(id)sender ;

@property (weak, nonatomic) IBOutlet UITextField *label;

@property(strong , nonatomic) NSThread* myThread ;

- (void) startThread;

@end
