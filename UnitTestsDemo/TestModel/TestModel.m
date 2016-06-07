//
//  TestModel.m
//  UnitTestsDemo
//
//  Created by dev on 6/7/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (instancetype)initWithName:(NSString *)name
                         age:(NSNumber *)age
                        flag:(NSUInteger)flag {
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
        self.flag = flag;
    }
    return self;
}

+ (instancetype)modelWithName:(NSString *)name age:(NSNumber *)age flag:(NSUInteger)flag {
    TestModel *testModel = [[TestModel alloc] initWithName:name age:age flag:flag];
    return testModel;
}

//- (instancetype)initWithDictonary:(NSDictionary *)dic {
//    self = [super init]
//}

@end
