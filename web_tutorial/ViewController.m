//
//  ViewController.m
//  web_tutorial
//
//  Created by GABRIEL VIEIRA on 13/02/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "ViewController.h"
#import "webService.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //PARA ESCONDER O TECLADO QUANDO CLICKAR NO BACKGROUND
    UITapGestureRecognizer *toque = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard:)];
    toque.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:toque];
}

- (void) hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    
    self.myThread = [[NSThread alloc] initWithTarget:self
                                            selector:@selector(startThread)
                                              object:nil];
    [self.myThread start];
}

- (void) startThread
{
    NSString *message =  [webService listar:self.label.text] ;
            
    UIAlertView *l = [[UIAlertView alloc]initWithTitle:@"Aluno" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
    [l show];
    
    [self.myThread cancel];
}

@end
