//
//  CollectionViewController.m
//  Slickdeals
//
//  Created by Justin Carstens on 4/29/13.
//  Copyright (c) 2013 BitSuites, LLC. All rights reserved.
//

#import "MainViewController.h"
#import "PSStackedView.h"
#import "PSStackedViewController.h"
#import "UIViewController+PSStackedView.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
	[self didRotateFromInterfaceOrientation:[self interfaceOrientation]];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	[self didRotateFromInterfaceOrientation:[self interfaceOrientation]];
	[self.containerView setAllowScaleIfOffScreen:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Interface Orientation

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	[super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	if (UIInterfaceOrientationIsLandscape([self interfaceOrientation])){
		[self.view setFrame:CGRectMake(0, 0, 1024, self.view.frame.size.height)];
		self.containerView.minScaleWidth = 703;
	} else {
		[self.view setFrame:CGRectMake(0, 0, 768, self.view.frame.size.height)];
		self.containerView.minScaleWidth = 448;
	}
	[[self stackController] updateViewControllerMasksAndShadow];
}

- (void)viewDidUnload {;
    [super viewDidUnload];
}
- (IBAction)replaceAction:(id)sender {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
	UIViewController *collectionView = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
	[[self stackController] pushViewController:collectionView fromViewController:[[self stackController] rootViewController] animated:YES];
	
}
@end
