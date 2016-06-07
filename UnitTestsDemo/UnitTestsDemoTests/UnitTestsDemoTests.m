//
//  UnitTestsDemoTests.m
//  UnitTestsDemoTests
//
//  Created by dev on 6/7/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestModel.h"

@interface UnitTestsDemoTests : XCTestCase

@end

@implementation UnitTestsDemoTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
}

- (void)testModelConvert {
    
    NSString *json = @"{\"name\":\"zhangsan\",\"age\":22,\"flag\":987654321}";
    
    NSMutableDictionary *dict = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding: NSUTF8StringEncoding] options:kNilOptions error: nil] mutableCopy];
    
    TestModel *model = [[TestModel alloc] initWithDictonary:dict];
    XCTAssertNotNil(model);
    XCTAssertTrue([model.name isEqualToString: @"zhangsan"]);
    XCTAssertTrue([model.age isEqual: @(22)]);
    XCTAssertEqual(model.flag, 987654321);
    XCTAssertTrue([model isKindOfClass: [TestModel class]]);
    
    model = [TestModel modelWithName:@"lisi" age:@(22) flag:11111];
    XCTAssertNotNil(model);
    XCTAssertTrue([model.name isEqualToString: @"lisi"]);
    XCTAssertTrue([model.age isEqual: dict[@"age"]]);
    XCTAssertEqual(model.flag, 11111);
    
    NSDictionary *modelJSON = [model modelToDictonary];
    XCTAssertTrue([modelJSON isEqual: dict] == NO);
    
    dict[@"name"] = @"lisi";
    dict[@"flag"] = @(11111);
    //XCTAssertTrue(![modelJSON isEqual:dict]);
    XCTAssertTrue([modelJSON[@"name"] isEqual:dict[@"name"]]);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
