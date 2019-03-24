//
//  Queue.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/23.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "Queue.h"

@implementation Queue

bool init_queue(LQueue pQueue,int queueCapacity) {
    //给数组指针分配内存
    pQueue->pBase = (ElemType *)malloc(sizeof(ElemType)*queueCapacity);
    if(!pQueue->pBase)
    {
        printf("给数组指针分配内存失败\n");
        return false;
    }
    
    pQueue->front = 0; //最开始创建时，队头索引为0
    pQueue->rear = 0; //最开始创建时，队尾索引为0
    pQueue->maxSize = queueCapacity;
    
    return true;
}

void destroy_queue(LQueue pQueue) {
    free(pQueue);
    pQueue = NULL;
}

bool isFullQueue(LQueue pQueue) {
    if((pQueue->rear+1)%pQueue->maxSize == pQueue->front) {
        //队列满
        return TRUE;
    }
    return FALSE;
}

bool isEmpityQueue(LQueue pQueue) {
    if (pQueue == NULL) {
        return false;
    }
    if (pQueue->front == pQueue->rear) {
        return true;
    }
    return false;
}

bool enQueue(LQueue pQueue,ElemType element) {
    if(isFullQueue(pQueue)==true)
    {
        printf("队列已满,不能再插入元素了!\n");
        return false;
    }
    
    //向队列中添加新元素
    pQueue->pBase[pQueue->rear] = element;
    pQueue->rear = (pQueue->rear+1) % pQueue->maxSize; //将rear赋予新的合适的值
    
    return true;
}

//新元素出队,同时保存出队的元素 [先进先出原则：在队头的位置删除]
bool deQueue(LQueue pQueue,ElemType *pElement) {
    //如果队列为空,则返回false
    if(isEmpityQueue(pQueue)==true)
    {
        printf("队列为空，出队失败!\n");
        return false;
    }
    
    *pElement = pQueue->pBase[pQueue->front];       //先进先出
    pQueue->front = (pQueue->front+1) % pQueue->maxSize; //移到下一位置
    
    return true;
}


@end
