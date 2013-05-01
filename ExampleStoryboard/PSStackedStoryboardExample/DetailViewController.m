//
//  DetailViewController.m
//  Slickdeals
//
//  Created by Justin Carstens on 4/29/13.
//  Copyright (c) 2013 BitSuites, LLC. All rights reserved.
//

#import "DetailViewController.h"
#import "PSStackedViewController.h"
#import "UIViewController+PSStackedView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
	[self.view setFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
    PSStackedViewController* stackController = [self stackController];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
	UIViewController *collectionView = [storyboard instantiateViewControllerWithIdentifier:@"SubDetailController"];
	[stackController queViewController:collectionView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
