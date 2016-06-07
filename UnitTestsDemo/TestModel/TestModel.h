//
//  TestModel.h
//  UnitTestsDemo
//
//  Created by dev on 6/7/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *age;
@property (assign, nonatomic) NSUInteger flag;

- (instancetype)initWithName:(NSString *)name
                         age:(NSNumber *)age
                        flag:(NSUInteger)flag;

+ (instancetype)modelWithName:(NSString *)name
                          age:(NSNumber *)age
                         flag:(NSUInteger)flag;

- (instancetype)initWithDictonary:(NSDictionary *)dic;

@end
