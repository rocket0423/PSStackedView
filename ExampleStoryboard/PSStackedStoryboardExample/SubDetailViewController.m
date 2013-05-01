//
//  SubDetailViewController.m
//  Slickdeals
//
//  Created by Justin Carstens on 4/29/13.
//  Copyright (c) 2013 BitSuites, LLC. All rights reserved.
//

#import "SubDetailViewController.h"
#import "PSStackedView.h"
#import "PSStackedViewController.h"
#import "UIViewController+PSStackedView.h"

@interface SubDetailViewController ()

@end

@implementation SubDetailViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Interface Orientation

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	[super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	float orgin = self.containerView.frame.origin.x;
	if (UIInterfaceOrientationIsLandscape([self interfaceOrientation])){
		if (fromInterfaceOrientation != [self interfaceOrientation] && [[self stackController] firstVisibleIndex] == 2 && [[self stackController] lastVisibleIndex] == 2)
			orgin = orgin + 65;
		[self.containerView setFrame:CGRectMake(orgin, 0, 703, self.view.frame.size.height)];
		[self.view setFrame:CGRectMake(0, 0, 703, self.view.frame.size.height)];
		self.containerView.minScaleWidth = 703;
	} else {
		if (fromInterfaceOrientation != [self interfaceOrientation] && [[self stackController] firstVisibleIndex] == 2 && [[self stackController] lastVisibleIndex] == 2)
			orgin = orgin - 65;
		[self.containerView setFrame:CGRectMake(orgin, 0, 768, self.view.frame.size.height)];
		[self.view setFrame:CGRectMake(0, 0, 768, self.view.frame.size.height)];
		self.containerView.minScaleWidth = 448;
	}
	[[self stackController] updateViewControllerMasksAndShadow];
}

@end
