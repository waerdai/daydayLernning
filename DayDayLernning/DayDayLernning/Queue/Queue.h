//
//  Queue.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/23.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 队列 在队前删除操作 在队尾插入操作
 队列假溢出->用循环队列解决 经济实惠
 
 循环队列，队满条件(pQueue->rear+1)%MAX_SIZE == pQueue->front
 */

typedef int ElemType;
#define MAX_SIZE 20

typedef struct queue {
    ElemType front;// 队首索引
    ElemType rear;// 队尾索引
    ElemType *pBase;// 数组指针
    int maxSize;// 最大容量
}queue, *LQueue;
@interface Queue : NSObject

// 初始化队列
bool init_queue(LQueue pQueue,int queueCapacity);
// 销毁队列
void destroy_queue(LQueue pQueue);

// 队空
bool isEmpityQueue(LQueue pQueue);
// 队满
bool isFullQueue(LQueue pQueue);

// 入对
bool enQueue(LQueue pQueue,ElemType element);
// 出队
bool deQueue(LQueue pQueue,ElemType *pElement);

@end

NS_ASSUME_NONNULL_END
