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
//    NSArray *classes = [NameClashesFinder classes];
//    NSLog (@"classes: %@", classes);
    
    Class toCheckCls = [NameClashesFinderVC class];
    //Class toCheckCls = [NSObject class];
    
    NSArray *properties = [toCheckCls properties];
    NSLog (@"properties: %@", properties);
    
    NSArray *instanceVariables = [toCheckCls instanceVariables];
    NSLog (@"instanceVariables: %@", instanceVariables);
    
    NSArray *classMethods = [toCheckCls classMethods];
    NSLog (@"classMethods: %@", classMethods);
    
    NSArray *instanceMethods = [toCheckCls instanceMethods];
    NSLog (@"instanceMethods: %@", instanceMethods);
    
    NSArray *protocols = [toCheckCls protocols];
    NSLog (@"protocols: %@", protocols);
    
    if (protocols.count > 0) {
        NSDictionary *description = [toCheckCls descriptionForProtocol:protocols.firstObject];
        NSLog (@"description: %@", description);
    }
    
    NSString *parentClassHierarchy = [toCheckCls parentClassHierarchy];
    NSLog (@"parentClassHierarchy: %@", parentClassHierarchy);
    
    
//    NSLog(@"获取所有加载的objective-c框架和动态库的名称");
//    unsigned int allOutCount = 0;
//    const char ** allImageNames = objc_copyImageNames(&allOutCount);
//    
//    const char *testLibImage = nil;
//    for (int i = 0; i < allOutCount; i++) {
//        const char *imageName = allImageNames[i];
//        char *isCompare = strstr(imageName, "TestLibProject");
//        if (isCompare) {
//            testLibImage = imageName;
//            break;
//        }
//    }
//    
//    NSLog (@"找到TestLibProject了: %s", testLibImage);
//
////    NSLog(@"获取指定类所在动态库");
////    NSLog(@"UIView's Framework: %s", class_getImageName(NSClassFromString(@"UIView")));
//
//    NSLog(@"获取指定库或框架中所有类的类名");
//    unsigned int outCount = 0;
//    testLibImage = class_getImageName(NSClassFromString(@"NSObject"));
//    NSLog (@"NSObject's Framework:: %s", testLibImage);
//    //const char ** classes = objc_copyClassNamesForImage(class_getImageName(NSClassFromString(@"UIView")), &outCount);
//    const char **classes = objc_copyClassNamesForImage(testLibImage, &outCount);
//    for (int i = 0; i < outCount; i++) {
//        NSLog(@"class name: %s", classes[i]);
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


