//
//  TestDynamicLayoutController.m
//  JUInspectorView
//
//  Created by Chris Hill on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestDynamicLayoutController.h"

@implementation TestDynamicLayoutController
@synthesize testViews;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        self.testViews = [NSMutableArray arrayWithCapacity:5];
    }
    
    return self;
}


- (void) awakeFromNib 
{
	[super awakeFromNib];
	/**
	 * [CH] After the nib has awoken the layout has been triggered and everything
	 * is good in layout-land. BUT if we add items to this controller's view 
	 * afterwards, then we'll want to make sure that layout is occuring as expected.
	 * 
	**/
	int r = (arc4random() % 5) + 4;
	NSLog(@"[CH] subviews: %d	", r);
	for(int i=0;i<r;i++)
	{
		NSViewController* viewController = [[[NSViewController alloc] initWithNibName:@"TestView2" bundle:nil] autorelease];
		[self.view addSubview:viewController.view];
		[self.testViews addObject:viewController.view];
	}
	[self layoutSubviews];
}

-(void)layoutSubviews
{
	CGFloat pos = 0;
	for(NSView* subview in self.testViews)
	{
		NSRect viewFrame = subview.frame;
		viewFrame.origin.y = pos;
		subview.frame = viewFrame;
		NSLog(@"[CH] subPos = %f", pos);
		pos += viewFrame.size.height;
	}
	NSRect myFrame = self.view.frame;
	myFrame.size.height = pos;
	NSLog(@"[CH] pos = %f, origin: %f", pos, myFrame.origin.y);
	self.view.frame = myFrame;
}


-(void)dealloc
{
	[testViews release];
	[super dealloc];
}


@end
