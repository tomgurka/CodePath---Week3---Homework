//
//  MainViewController.m
//  Week3
//
//  Created by Tom Gurka on 6/18/14.
//  Copyright (c) 2014 tom. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

- (IBAction)newsPan:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *newsView;
@property (weak, nonatomic) IBOutlet UIImageView *accountView;
@property (assign,nonatomic) CGPoint originalCenter;
- (IBAction)pressNews:(UIButton *)sender;

@end

@implementation MainViewController

{
    CGPoint updateCenter;
}

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
    // Do any additional setup after loading the view from its nib.
    
    //Remember the original center mark
    self.originalCenter = CGPointMake(self.newsView.center.x, self.newsView.center.y);
    
    self.accountView.alpha = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newsPan:(UIPanGestureRecognizer *)sender {
    
    CGPoint touchPosition = [sender locationInView:self.view];
    CGPoint vel = [sender velocityInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        //Help remember center
        updateCenter = CGPointMake(self.newsView.center.x, touchPosition.y - self.newsView.center.y);
  
    }
    
    else if (sender.state == UIGestureRecognizerStateChanged){
        
        //Move the view around
        self.newsView.center = CGPointMake(self.newsView.center.x, touchPosition.y - updateCenter.y);
        
        //Show View
        [UIView animateWithDuration:0.4  animations:^{
            self.accountView.alpha = 1;
        } completion:nil];
        
        //Velocity Check
        NSLog(@"Velocity %f", vel.y);
        
    }
    
    else if (sender.state == UIGestureRecognizerStateChanged | self.newsView.center.y < 284){


        self.newsView.center = CGPointMake
        (self.newsView.center.x, (touchPosition.y - updateCenter.y) * .5);
        
    }
         
//            // News View to Origin
//            [UIView animateWithDuration:0.4  animations:^
//            {
//                self.newsView.center = CGPointMake(self.newsView.center.x, self.originalCenter.y);} completion:nil];

    
    
    // Animate Down
    else if (sender.state == UIGestureRecognizerStateChanged | self.newsView.center.y > 500)
    {
        //Show Settings View
        [UIView animateWithDuration:0.4  animations:^{
        self.accountView.alpha = 1;
            } completion:nil];
        
        //Push View Down
        [UIView animateWithDuration:0.4  animations:^{
            self.newsView.center = CGPointMake(self.newsView.center.x, 805);
        } completion:nil];
    }
    
     // Animate Up
    else if (sender.state == UIGestureRecognizerStateEnded | self.newsView.center.y > 430)
    {
        
        // News View to Origin
        
        [UIView animateWithDuration:0.4  animations:^{
            self.newsView.center = CGPointMake(self.newsView.center.x, self.originalCenter.y);
        } completion:nil];
        
        // Hide Settings View
        [UIView animateWithDuration:0.4  animations:^{
            self.accountView.alpha = 0;
        } completion:nil];
        
    }
}

- (IBAction)pressNews:(UIButton *)sender {
    if (self.newsView.center.x, 805)
        
        // News View to Origin
        [UIView animateWithDuration:0.6  animations:^
         {
             self.newsView.center = CGPointMake(self.newsView.center.x, self.originalCenter.y);} completion:nil];
}

@end