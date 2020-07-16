//
//  NajamDemoFrameworkTests.m
//  NajamDemoFrameworkTests
//
//  Created by Syed Najam on 16/07/2020.
//  Copyright © 2020 Syed Najam. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ServicesManager.h"

@interface NajamDemoFrameworkTests : XCTestCase

@end

@implementation NajamDemoFrameworkTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//Will check for Valid Username, Network Connection, Response Time and API Results
- (void)testCaseForAPIMethodAndBaseLineTime {
    
    NSString *username = @"apple";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"should retrun response"];
    
    ServicesManager *manager = [[ServicesManager alloc] init];
    [manager didGetCall:username successBlock:^(id responseObject) {
        
        [expectation fulfill];
        XCTAssertNotNil(responseObject);
        
    } failureBlock:^(NSError *error) {
        
        [expectation setAssertForOverFulfill:TRUE];
        XCTAssertNil(error);
    }];
    
    NSArray *array = [[NSArray alloc] initWithObjects:expectation, nil];
    [self waitForExpectations:array timeout:30];
}

- (void)testPerformanceExample {
    
    [self measureBlock:^{
        
    }];
}

@end
