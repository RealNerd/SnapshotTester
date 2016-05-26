//
//  SnapshotTesterScreenshots.m
//  SnapshotTesterScreenshots
//
//  Created by Blake Schwendiman on 5/26/16.
//  Copyright © 2016 MDLive. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SnapshotTesterScreenshots-Swift.h"
#import "SDStatusBarManager.h"

@interface SnapshotTesterScreenshots : XCTestCase

@end

@implementation SnapshotTesterScreenshots

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [[SDStatusBarManager sharedInstance] enableOverrides];
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [Snapshot setupSnapshot:app];
    [app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [[SDStatusBarManager sharedInstance] disableOverrides];
    [super tearDown];
}

- (void)testExample {
    XCUIElementQuery *tabBarsQuery = [[XCUIApplication alloc] init].tabBars;
    
    [[tabBarsQuery.buttons elementBoundByIndex:1] tap];
    [Snapshot snapshot:@"01SecondTab" waitForLoadingIndicator:YES];
    
    [[tabBarsQuery.buttons elementBoundByIndex:0] tap];
    [Snapshot snapshot:@"02FirstTab" waitForLoadingIndicator:YES];
}

@end
