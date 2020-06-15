//
//  ClassA+Run.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/4/4.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ClassA+Run.h"
#import "objc/runtime.h"
#import <objc/message.h>

@implementation ClassA (Run)


//+ (void)initialize {
//    if (self == NSClassFromString(@"ClassA")) {
//        NSLog(@"ClassA initialize");
//    }
//}
//
//+ (void)load {
//    Class class = [self class];
//    SEL sig = @selector(run);
//    unsigned int count = 0;
//    Method *methodList = class_copyMethodList(class, &count);
//    Method caM = class_getInstanceMethod([self class], sig);
//    Method temM = NULL;
//
//    for (int i = 0; i < count; i++) {
//        Method m = methodList[i];
//        SEL sel = method_getName(m);
//        if (sel_isEqual(sel, sig)) {
//            temM = m;
//        }
//    }
//
//    if (temM) {
//        method_exchangeImplementations(caM, temM);
//    }
//
//    free(methodList);
//    methodList = nil;
//}

- (void)run {
    NSLog(@"ClassA (Run)--%@--%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
