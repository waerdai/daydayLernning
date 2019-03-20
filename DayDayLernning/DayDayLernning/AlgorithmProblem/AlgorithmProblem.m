//
//  AlgorithmProblem.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/20.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "AlgorithmProblem.h"

@implementation AlgorithmProblem

// 斐波那契数列
int feibo(int n) {
    if (n <= 0) {
        return -1;
    }
    
    if (n <= 2) {
        return 1;
    }
    return feibo(n - 1)+feibo(n-2);
}

@end
