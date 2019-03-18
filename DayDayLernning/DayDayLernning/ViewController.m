//
//  ViewController.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/18.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ViewController.h"
#import "Sort_C.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.快速排序
    int intArray[] = {1,5,6,4,2,3};
    quickSort(intArray, 0, 5);
    printf("quickSort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("quickSort:%d", intArray[i]);
        printf("\n");
    }
    
    // 2.归并排序
    int merge[] = {1,3,2,5,6,4};
    merge_sort(merge, 5);//传入 数组最后下标
    printf("merge_sort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("merge_sort:%d", merge[i]);
        printf("\n");
    }
    
    // 3.选择排序
    int selectsort[] = {1,5,6,3,2,4};
    select_sort(selectsort, 6);
    printf("selectsort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("selectsort:%d", merge[i]);
        printf("\n");
    }
    
    // 4.插入排序
    int insertsort[] = {1,5,6,3,2,4};
    insert_sort(insertsort, 6);
    printf("insertsort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("insertsort:%d", merge[i]);
        printf("\n");
    }
    
}


@end
