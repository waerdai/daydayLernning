//
//  AlgorithmProblem.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/20.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 一些常见的算法问题 算法题
@interface AlgorithmProblem : NSObject

// 佩波那契数列
int feibo(int n);

// 尾递归求阶乘,m为出栈的解
int facto(int n);
int jiecheng(int n, int m);

// 求x的y次幂
double x_pow_y(double x,int y);
/// 求x的y次幂 非递归
double x_pow_y_2(double x,int y);

/// 求众数 出现次数大于 n/2
int majority(int a[], int len);

// 不用临时变量 两数交换
void int__swap(int *a, int *b);

char* isSubString(char *s1,char *s2);
void printStars(int n);

// 二分查找
int binarySearch(int a[],int len, int key);

/**
 A "aabbcc"
 B "ccaabb"
 则认为 A==B
 */
bool isEqualString(char *a, char *b);

// 反转 单个单词 p首个字符串 q尾部字符串
void reverseWord(char *p , char *q);

// 反转句子
void reverseString(char *s);

// 反转句子中 每个单词
void reverseWords(char *s, char *flag);
// 重复元素的删除
int deleteDumpElem(int a[], int len);
// 删除间隔为 margain的元素
int deleteMargainDumpElem(int a[], int len, int margain);
int deleteMargainOneSame(int a[], int len);

// 字符串 大数 相加
- (NSString *)addMaxString:(NSString *)str1 str2:(NSString *)str2;

// 求给定视图 层级数
int maxDepth(UIView* root);
// 返回视图 所有子节点
+ (NSArray *)numberOfPlies:(UIView *)view;
// 最大公共子视图
+ (UIView *)maxPublicView:(UIView *)view1 view2:(UIView *)view2;

@end

NS_ASSUME_NONNULL_END
