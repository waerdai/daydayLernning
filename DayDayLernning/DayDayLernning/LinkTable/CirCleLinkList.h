//
//  CirCleLinkList.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/20.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/***
 循环链表
 */
typedef struct CircleNode
{
    int data;
    struct CircleNode *next;
}CircleNode,*CircleList;

@interface CirCleLinkList : NSObject

CircleList initCircleList(void);
CircleList initinitCircleNode(int data) ;
bool isCircleListEmpty(CircleList head);

@end

NS_ASSUME_NONNULL_END
