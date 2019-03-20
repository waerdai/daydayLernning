//
//  DoubleLinkTable.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/19.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct DuLNode
{
    int data;
    struct DuLNode *prior,*next;
}DuLNode,*DuLinkList;

@interface DoubleLinkTable : NSObject

// 初始化 双向链表
DuLinkList initLinkList(void) ;
// 初始化 节点
DuLinkList initDulNode(int data);
// 在下标 index处 插入值为data的节点
void insert(DuLinkList head,int data,int index) ;

// 正序查找
DuLinkList getElemWithData(DuLinkList head, int data) ;
// 逆序查找
DuLinkList backToElemWithData(DuLinkList head, int data) ;
// 根据index下标 查找元素
DuLinkList getElemWithIndex(DuLinkList head, int index) ;
// 删除元素 node
void deleteElem(DuLinkList head, DuLinkList node) ;
// 双向链表长度
int listLength(DuLinkList head) ;
// 双向链表 是否为空
bool isEmpty(DuLinkList head) ;

@end

NS_ASSUME_NONNULL_END
