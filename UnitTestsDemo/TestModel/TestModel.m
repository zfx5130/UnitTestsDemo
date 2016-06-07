//
//  TestModel.m
//  UnitTestsDemo
//
//  Created by dev on 6/7/16.
//  Copyright © 2016 zfx5130. All rights reserved.
//

#import "TestModel.h"
#import <objc/runtime.h>

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

- (instancetype)initWithDictonary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (NSDictionary *)modelToDictonary {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    // 获取类名/根据类名获取类对象
    NSString *className = NSStringFromClass([self class]);
    id classObject = objc_getClass([className UTF8String]);
    // 获取所有属性
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(classObject, &count);
    // 遍历所有属性
    for (int i = 0; i < count; i++) {
        // 取得属性
        objc_property_t property = properties[i];
        // 取得属性名
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        // 取得属性值
        id propertyValue = nil;
        id valueObject = [self valueForKey:propertyName];
        
        if ([valueObject isKindOfClass:[NSDictionary class]]) {
            propertyValue = [NSDictionary dictionaryWithDictionary:valueObject];
        } else if ([valueObject isKindOfClass:[NSArray class]]) {
            propertyValue = [NSArray arrayWithArray:valueObject];
        } else {
            propertyValue = [NSString stringWithFormat:@"%@", [self valueForKey:propertyName]];
        }
        [dict setObject:propertyValue forKey:propertyName];
    }
    return [dict copy];
}


@end
