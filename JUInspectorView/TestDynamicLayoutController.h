//
//  TestDynamicLayoutController.h
//  JUInspectorView
//
//  Created by Chris Hill on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * This class tests that items that are created with dynamic layouts correctly
 * update within the JUInspectorView.
 */
@interface TestDynamicLayoutController : NSViewController
-(void)layoutSubviews;

@property (nonatomic,retain) NSMutableArray* testViews;
@end
