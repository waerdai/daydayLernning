//
//  ClassB.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/4/4.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB

- (void)run {
    NSLog(@"%@--%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
