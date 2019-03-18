//
//  Sort_C.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/18.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "Sort_C.h"

@implementation Sort_C


// 不用临时变量 交换a与b
void int_swap(int *a, int *b) {
    if (a == NULL || b == NULL) {
        return;
    }
    
    *a = *a^*b;
    *b = *a^*b;
    *a = *a^*b;
}

#pragma mark -- 快排

/// 快排之所以快 是因为 交换跳跃式
/// 找一个 key 从后向前找小于key的 first
/// 从前向后找大于key的 last 交换 first与last
/// 交换完成 key归位 a[first] = key,然后递归
void quickSort(int a[], int low, int high) {
    if (low >= high) {
        return;
    }
    
    int first = low;
    int last = high;
    int key = a[first];
    
    while (first < last) {
        // last 从后向前找 小于key的数
        while (first < last && a[last] >= key) {
            --last;
        }
        a[first] = a[last];// 小数移到小端
        // first 从前向后找 大于key的数
        while (first < last && a[first] <= key) {
            ++first;
        }
        a[last] = a[first];//大数移到 大端
    }
    // key 归位
    a[first] = key;
    
    quickSort(a, low, first - 1);
    quickSort(a, first + 1, high);
}

#pragma mark -----


#pragma mark -- 归并排序

// 归并排序
void merge_sort(int a[], int len) {
    merge(a, 0, len);
}

// 归并排序的合并
void merge_add(int a[], int low, int mid, int high) {
    int left_low = low;
    int left_high = mid;
    int right_low = mid + 1;
    int right_high = high;
    
    int *tmp = (int *)malloc((high-low+1)*sizeof(int));// 辅助表
    int k = 0;// 辅助 游标
    
    // 合并 有序表
    // 1. 两个数组都未越界
    while (left_low <= left_high && right_low <= right_high) {
        if (a[left_low] <= a[right_low]) {
            tmp[k] = a[left_low];
            left_low++;
        }
        else if(a[left_low] > a[right_low]) {
            tmp[k] = a[right_low];
            right_low++;
        }
        k++;
    }
    // 2.left 数组越界
    while (right_low <= right_high) {
        tmp[k] = a[right_low];
        k++;
        right_low++;
    }
    // 3.right 数组越界
    while (left_low <= left_high) {
        tmp[k] = a[left_low];
        k++;
        left_low++;
    }
    
    k = 0;
    while(low <= high){
        a[low++] = tmp[k++];
    }
    
    free(tmp);
    tmp = NULL;
}

// 归并排序的 递归分解
void merge(int a[], int low, int high) {
    if (high - low < 2) {
        if (a[low] > a[high]) {
            int_swap(&a[low], &a[high]);
        }
        return;
    }
    
    int mid = low + (high - low)/2;
    merge(a, low, mid);
    merge(a, mid + 1, high);
    merge_add(a, low, mid, high);
}

#pragma mark ----

#pragma mark -- 选择排序

void select_sort(int a[], int len) {
    for (int i = 0; i < len; i++) {
        int min = 0;
        for (int j = i; j < len; j++) {
            if (a[j] < min) {
                min = a[j];
            }
        }
        int_swap(&a[i], &min);
    }
}

#pragma mark ----

#pragma mark -- 插入排序

void insert_sort(int a[], int len) {
    int i,j,temp;
    for (i = 0; i < len; i++) {
        temp = a[0];
        j = i;
        while (j > 0 && a[j] > temp) {
            a[j] = a[j - 1];
            j--;
        }
        a[j] = temp;
    }
}

#pragma mark ----

@end
