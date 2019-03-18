//
//  Sort_C.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/18.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sort_C : NSObject


/**
 快速排序 不稳定

 快排之所以快 是因为 交换跳跃式
 找一个 key 从后向前找小于key的 first
 从前向后找大于key的 last 交换 first与last
 交换完成 key归位 a[first] = key,然后递归
 */
void quickSort(int a[], int low, int high);

/**
 归并排序 稳定
 
 效率仅次于 快排 要用到临时表做归并用
 */
void merge_sort(int a[], int len);


/**
 选择排序 不稳定
 
 每次选择最大或者最小的数 与
 大端或者小端 交换
 */
void select_sort(int a[], int len);

/**
 插入排序 稳定
 
 从前面的有序表中找到比temp大的数 依次后移
 找到坐标 j 将tempcharu
 */
void insert_sort(int a[], int len);

@end

NS_ASSUME_NONNULL_END
