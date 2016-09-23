//
//  InterviewTests.m
//  InterviewTests
//
//  Created by Shawn Webster on 8/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CCIArraysAndStrings.h"


@interface InterviewTests : XCTestCase

@end

@implementation InterviewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)test_matrixRotation {
    // Do any additional setup after loading the view, typically from a nib.
    
//    TestClass *instance = [TestClass new];
//    NSLog(@"%@", instance.string);
//    NSLog(@"%@", [instance returnSomething]);
    
    NSString *originalString = @"two spaces here";
    NSMutableString *inString = [NSMutableString stringWithFormat:@"%@////", originalString];
    [CCIArraysAndStrings encodeSpaces:inString];
    NSLog(@"%@", inString);
    
    int n = 10;
    int **matrix;
    
    //allocate space for the array
    matrix = malloc(sizeof(int*) * n);
    for (NSInteger i=0; i<n; i++) {
        matrix[i] = malloc(sizeof(int) * n);
    }
    
    //put stuff into the array
    for (NSInteger i=0; i<n*n; i++) {
        matrix[i/n][i%n] = (int)i+1;
    }
    
    for (int i=0; i<4; i++) {
        [CCIArraysAndStrings rotate:(int**)matrix n:n];
    }
    
    //free up the space
    for (NSInteger i=0; i<n; i++) {
        free(matrix[i]);
    }
    free(matrix);
}

@end
