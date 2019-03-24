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
 */
typedef struct queue {
    struct queue *front;// 队首
    struct queue *rear;// 队尾
    int data;
}queue, *LQueue;
@interface Queue : NSObject

@end

NS_ASSUME_NONNULL_END
