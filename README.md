# UnitTestsDemo



####单元测试概念及功能

- 在计算机编程中，单元测试（英语：Unit Testing）又称为模块测试, 是针对程序模块（软件设计的最小单位）来进行正确性检验的测试工作。程序单元是应用的最小可测试部件。
- 单元测试并不是为了证明代码的正确性，它只是一种用来帮助我们发现错误的手段。
- 单元测试不是万能药，它确实能帮助我们找到大部分代码逻辑上的bug，同时，为了提高测试覆盖率，这能逼迫我们对代码不断进行重构，提高代码质量等。

#####单元测试分类

 - 性能测试：测试代码执行花费的时间。
 - 逻辑测试：测试代码执行结果是否符合预期。
 - 异步测试：测试多线程操作代码。

#####测试相关方法

```
@implementation UnitTestsDemoTests

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

@end

```

####测试相关方法说明

```
 1. setUp:setUp会在每一个测试用例开始前调用，用来初始化相关数据。
 2. tearDown在测试用例完成后调用，可以用来释放变量等结尾操作。
 3. testExample用来执行我们需要的测试操作，正常情况下，我们不使用这个方法，而是创建名为test+测试目的的方法来完成我们需要的操作。
 4. testPerformanceExample中的会将方法中的block代码耗费时长打印出来。

```

#### 测试运行
```
1. 在每个测试用例方法的左侧有个菱形的标记，点击这个标记可以单独的运行这个测试方法。
2. 如果测试通过没有发生任何断言错误，那么这个菱形就会变成绿色勾选状态。
3. 使用快捷键command+U直接依次调用所有的单元测试。
4. 另外，可以在左侧的文件栏中选中单元测试栏目，然后直观的看到所有测试的结果。
5. 同样的点击右侧菱形位置的按钮可以运行单个测试方法或者文件。

```

#### 测试常用宏

```
XCTAssertNotNil(a1, format…) 当a1不为nil时成立；
XCTAssert(expression, format...) 当expression结果为YES成立；
XCTAssertTrue(expression, format...) 当expression结果为YES成立；
XCTAssertEqualObjects(a1, a2, format...) 判断相等，当[a1 isEqualTo: a2]返回YES的时候成立；
XCTAssertEqual(a1, a2, format...) 当a1==a2返回YES时成立；
XCTAssertNotEqual(a1, a2, format...) 当a1!=a2返回YES时成立；
XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...)判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/-accuracy）以内相等时通过测试；
XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...) 判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
XCTAssertThrows(expression, format...)异常测试，当expression发生异常时通过；反之不通过；（很变态） XCTAssertThrowsSpecific(expression, specificException, format...) 异常测试，当expression发生specificException异常时通过；反之发生其他异常或不发生异常均不通过；
XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...)异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
XCTAssertNoThrow(expression, format…)异常测试，当expression没有发生异常时通过测试；
XCTAssertNoThrowSpecific(expression, specificException, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；

```

####总结
- 最开始笔者一度认为单元测试是个比较考验技术的东西，但恰恰相反的，单元测试的使用与概念是相当简单的一个东西，难点在于不知道怎么用，这就需要我们持续的使用练习才能更好的服务于我们的开发。此外，常用的第三方框架例如YYModel、AFNetworking、Alamofire等等优秀框架中也有对框架自身编写的单元测试，学习仿写这些单元测试也是快速提升自己的一种手段。
- 很多时候，我们的项目中难免发生多个类之间的交互处理，而这种操作非常的不好调试。单元测试的原则之一就在于我们用来测试的代码要求功能很单一，这其实与良好的代码设计的思想是非常相符的。一方面来说，良好的代码结构设计可以让我们的测试用例的构建更加快速简单；反过来单元测试逼着我们去想办法减少类之间的耦合以此来减少甚至排除测试的干扰。无论如何，如果你想成为更好的开发者，单元测试是我们快速提升代码认知的重要手段之一。

####相关参考资料

__1__.[iOS开发-单元测试](http://www.jianshu.com/p/11124d7f4968)