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

int facto(int n) {
    return jiecheng(n, 1);
}

// 尾递归求阶乘
int jiecheng(int n, int m) {
    if (n < 2) {
        return m;
    }
    return jiecheng(n - 1, m *n);
}

// 求x的y次幂
double x_pow_y(double x,int y) {
    if (x == 0) {
        return 0;
    }
    if (y == 0) {
        return 1;
    }
    
    if (y < 0) {
        x = 1/(double)x;
        y = abs(y);
    }
    return x*x_pow_y(x, y - 1);
}

// 不用临时变量 两数交换
void int__swap(int *a, int *b) {
    if (a == NULL || b == NULL) {
        return;
    }
    
    *a = *a^*b;
    *b = *a^*b;
    *a = *a^*b;
}

// 交换两个字符
void char_swap(char *a, char *b) {
    if (a == NULL || b == NULL) {
        return;
    }
    
    *a = *a^*b;
    *b = *a^*b;
    *a = *a^*b;
}

// 二分查找
int binarySearch(int a[],int len, int key) {
    int lo = 0,hi = len -1, mid = 0;
    
    while (lo <= hi) {
        mid = lo + (hi - lo) / 2;
        if (key > a[mid]) {
            lo = mid + 1;
        }
        else if (key < a[mid]) {
            hi = mid - 1;
        }else {
            return mid;
        }
    }
    return -1;
}

/**
 A "aabbcc"
 B "ccaabb"
 则认为 A==B
 */
bool isEqualString(char *a, char *b) {
    if (!a || !b) {
        return NO;
    }
    
    // 65-90 A-Z，97-122 a-z
    int a_array[26] = {};
    int b_array[26] = {};
    
    while (*a) {
        if ((*a >= 65) && (*a <= 90)) {
            a_array[*a - 'a'] += 1;
        }
        else if ((*a >= 97) && (*a <= 122)) {
            a_array[*a - 'A'] += 1;
        }
        a++;
    }
    
    while (*b) {
        if ((*a >= 65) && (*a <= 90)) {
            b_array[*b - 'a'] += 1;
        }
        else if ((*a >= 97) && (*a <= 122)) {
            b_array[*b - 'A'] += 1;
        }
        b++;
    }
    
    for (int i = 0; i < 26; i++) {
        if (a_array[i]!=b_array[i]) {
            return NO;
        }
    }
    
    return YES;
}

// 字符串 大数 相加
- (NSString *)addMaxString:(NSString *)str1 str2:(NSString *)str2 {
    if (str1.length == 0 && str2.length == 0) {
        return @"";
    }
    else if (str2.length == 0) {
        return str1;
    }else if (str1.length == 0) {
        return str2;
    }
    
    // 高位补齐
    if (str2.length > str1.length) {
        while (str2.length > str1.length) {
            str1 = [@"0" stringByAppendingString:str1];
        }
    }
    else if (str2.length < str1.length) {
        while (str1.length > str2.length) {
            str2 = [@"0" stringByAppendingString:str2];
        }
    }
    
    NSString *resultString = @"";
    NSInteger carry = 0;// 进位
    for (NSInteger i = (str1.length - 1); i >= 0; i--) {
        // 取出 一位字符串 转为 整形计算
        NSString *a_str = [str1 substringWithRange:NSMakeRange(i, 1)];
        NSString *b_str = [str2 substringWithRange:NSMakeRange(i, 1)];
        NSInteger a = [a_str integerValue];
        NSInteger b = [b_str integerValue];
        
        NSInteger sum = a + b;
        
        if (carry != 0) {//加入进位
            sum += carry;
            carry = 0;
        }
        
        if (sum >= 10) {//有进位
            sum -= 10;
            carry = 1;
        }
        
        resultString = [[NSString stringWithFormat:@"%ld", sum] stringByAppendingString:resultString];
    }
    
    return resultString;
}

// 反转 单个单词 p首个字符串 q尾部字符串
void reverseWord(char *p , char *q) {
    while (p < q) {
        char_swap(p, q);
        p++;
        q--;
    }
}

// 反转句子
void reverseString(char *s) {
    if (s == NULL) {
        return;
    }
    
    char *p = s;
    char *q = s;
    // q移至尾部
    while ('\0' != *q) {
        q++;
    }
    // ‘\0’前移 指向最后一个 字符
    q--;
    
    reverseWord(p, q);
}

// 反转句子中 每个单词
void reverseWords(char *s, char *flag) {
    if (s == NULL) {
        return;
    }
    if (flag == NULL) {
        reverseString(s);
        return;
    }
    // 先反转句子
    reverseString(s);
    
    char *p = s;// 头指针
    char *q = s;// 尾指针
    
    while ('\0' != *s) {
        // 再 反转 句子中每个单词
        if (*s == *flag) {
            q = s - 1;// 空格 前一 字符
            // 反转 单词
            reverseWord(p, q);
            // 指向下一个 反转单词
            p = s + 1;
        }
        s++;
    }
    // while循环 结束 p指向最后一个单词 s指向‘\0’
    
    s--;// s指向 最后一个单词 尾部
    reverseWord(p, s);// 反转 最后一个单词
}

// 求给定视图 层级数
int maxDepth(UIView* root) {
    if(!root) return 0;
    
    /**
     对于N叉树 对于每一节点 递归求深度
     直到所有节点 全部递归入栈
     
     然后 执行max+1 回归 比较各分支深度
     并取 最大值
     */
    int max = 0;
    for (UIView *subView in root.subviews) {
        max = MAX(max, maxDepth(subView));
    }
    
    return 1 + max;
}

+ (NSArray *)numberOfPlies:(UIView *)view {
    if (!view) {
        return 0;
    }
    NSMutableArray *array_m = [NSMutableArray arrayWithCapacity:0];
    [self numberOfPlies:view array_m:array_m];
    
    return [array_m copy];
}

// 将view子视图加入array_m
+ (void)numberOfPlies:(UIView *)view array_m:(NSMutableArray *)array_m {
    if (!view || view.subviews.count == 0) {
        return;
    }
    for (UIView *subView in view.subviews) {
        [array_m addObject:subView];
        [self numberOfPlies:subView array_m:array_m];
    }
}

@end
