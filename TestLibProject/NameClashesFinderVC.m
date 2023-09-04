//
//  NameClashesFinderVC.m
//  TestLibProject
//
//  Created by Ben on 2017/8/21.
//  Copyright © 2017年 PPTV. All rights reserved.
//

#import "NameClashesFinderVC.h"
#import "NSObject+DLIntrospection.h"
#import <objc/runtime.h>

@interface NameClashesFinderVC ()

@end

@implementation NameClashesFinderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // DLIntrospection
    NSArray *classes = [NameClashesFinderVC classes];
    NSLog (@"classes: %@", classes);
    
    Class toCheckCls = [NameClashesFinderVC class];
    //Class toCheckCls = [NSObject class];
    
    NSArray *properties = [toCheckCls properties];
    NSLog (@"properties: %@", properties);
    
    NSArray *instanceVariables = [toCheckCls instanceVariables];
    NSLog (@"instanceVariables: %@", instanceVariables);
    
    NSArray *classMethods = [toCheckCls classMethods];
    //NSLog (@"classMethods: %@", classMethods);
    NSLog (@"重复的类方法: ");
    [self showDuplicateMethodStringWithArray:classMethods];
    
    NSArray *instanceMethods = [toCheckCls instanceMethods];
    //NSLog (@"instanceMethods: %@", instanceMethods);
    NSLog (@"重复的实例方法: ");
    [self showDuplicateMethodStringWithArray:instanceMethods];
    
    NSArray *protocols = [toCheckCls protocols];
    NSLog (@"protocols: %@", protocols);
    
    NSString *parentClassHierarchy = [toCheckCls parentClassHierarchy];
    NSLog (@"parentClassHierarchy: %@", parentClassHierarchy);
    
    
    NSLog(@"获取所有加载的objective-c框架和动态库的名称");
    unsigned int allOutCount = 0;
    const char ** allImageNames = objc_copyImageNames(&allOutCount);
    
    const char *testLibImage = nil;
    for (int i = 0; i < allOutCount; i++) {
        const char *imageName = allImageNames[i];
        printf("%s\n", imageName);
        char *isCompare = strstr(imageName, "TestLibProject");
        if (isCompare) {
            testLibImage = imageName;
            break;
        }
    }
    
    NSLog (@"找到TestLibProject了: %s", testLibImage);

    NSLog(@"获取指定类所在动态库");
    NSLog(@"UIView's Framework: %s", class_getImageName(NSClassFromString(@"UIView")));

    NSLog(@"获取指定库或框架中所有类的类名");
    unsigned int outCount = 0;
    testLibImage = class_getImageName(NSClassFromString(@"NSObject"));
    NSLog (@"NSObject's Framework:: %s", testLibImage);
    //const char ** classes = objc_copyClassNamesForImage(class_getImageName(NSClassFromString(@"UIView")), &outCount);
    const char **xxxclasses = objc_copyClassNamesForImage(testLibImage, &outCount);
    for (int i = 0; i < outCount; i++) {
        NSLog(@"class name: %s", xxxclasses[i]);
    }
}

- (void)showDuplicateMethodStringWithArray:(NSArray *)methodStringArray {
    NSMutableDictionary *methodToCountDict = [NSMutableDictionary dictionary];
    
    for (NSString *methodString in methodStringArray) {
        NSNumber *count = [methodToCountDict objectForKey:methodString];
        if (!count) {
            [methodToCountDict setObject:@(1) forKey:methodString];
        } else {
            [methodToCountDict setObject:@([count intValue] + 1) forKey:methodString];
        }
    }
    
    for (NSString *methodString in [methodToCountDict allKeys]) {
        NSNumber *count = [methodToCountDict objectForKey:methodString];
        if (count && ([count intValue] > 1)) {
            NSLog (@"%@ %@次", methodString, count);
        }
    }
}

- (void)justForTest {
    NSLog (@"Just for test in class");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


