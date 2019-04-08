//
//  ClassB+Run.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/4/4.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ClassB+Run.h"

@implementation ClassB (Run)

- (void)run {
    [super run];
    NSLog(@"ClassA (Run)--%@--%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
