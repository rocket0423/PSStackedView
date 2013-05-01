//
//  MainNavBarController.m
//  PSStackedStoryboardExample
//
//  Created by Justin Carstens on 4/30/13.
//  Copyright (c) 2013 University of Washington. All rights reserved.
//

#import "MainNavBarController.h"
#import "PSStackedViewController.h"

@interface MainNavBarController ()

@end

@implementation MainNavBarController

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
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
	UIViewController *menuController = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
	[menuController.view setFrame:CGRectMake(menuController.view.frame.origin.x, menuController.view.frame.origin.y, 320, menuController.view.frame.size.height)];
	PSStackedViewController *stackController = [[PSStackedViewController alloc] initWithRootViewController:menuController];
	UIViewController *collectionView = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
	
	[stackController setEnableBounces:NO];
	[stackController setLeftInset:0];
	[stackController setLargeLeftInset:320];
	[stackController pushViewController:collectionView animated:NO];
	[stackController.view setFrame:CGRectMake(0, 0, mainContainer.frame.size.width, mainContainer.frame.size.height)];
	[mainContainer addSubview:stackController.view];
	[self addChildViewController:stackController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
