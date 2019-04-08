//
//  ClassA.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/4/4.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

- (void)run {
    NSLog(@"%@--%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
