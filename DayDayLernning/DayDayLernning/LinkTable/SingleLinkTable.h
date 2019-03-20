//
//  SingleLinkTable.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/19.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 链表操作 头指针 不参与
// 操作从 头节点开始
/***
 9.链表 是否有交点 并求交点
 （1）链表是否有环，用快慢指针
 fast>low 有环，求交点
 p指向表头指针
 while(p!=low){
 p++;
 low++;
 }
 求元素个数
 int count=0;//计数器
 Node *p=low;
 do
 {
 count++;
 low = low->next;
 fast=fast->next->next;
 }while(low!=fast);
 
 
 （2）链表相交 -->判断尾指针是否相等，即可
 求交点，计算表1(p)长度a，表2(q)长度b，做差c = abs(b-a);
 指针 p=q=head->next;
 然后
 if (a > b){
 p+=c;
 }
 else if(a < b){
 q+=c;
 }
 
 while(p!=q){
 p++;
 q++;
 }
 p==q 即是交点
 （3）反转链表
 
 pPrev->指向前一节点
 pNode->指向当前节点
 */


NS_ASSUME_NONNULL_BEGIN

typedef struct Node {
    struct Node *next;
    int data;
}Node;

@interface SingleLinkTable : NSObject


/**
 初始化 链表
 
 @return head 链表头指针
 */
Node* initSingleLinkTable(void) ;

// 初始化 节点
Node* initNode(int data) ;

// 头插法
void insertNode(Node *head,Node *node) ;
// 链表元素个数
int lengthOfSingleLink(Node *head) ;

// 查找 节点
Node* getNode(Node *head, int data) ;
// 元素下标
int localOfNode(Node *head, int data) ;
// 删除元素
void deleteNode(Node *head, int data) ;
// 打印元素
void printfSingleLink(Node *head) ;
// 反转链表
void reverseLink(Node *head) ;

// 链表是否有交点
bool singleLinkIsUnit(Node *head_a,Node *head_b);
// 返回链表的交点
Node* getLinkUnitNode(Node *head_a,Node *head_b);
// 链表是否有坏
bool linkIsCircle(Node *head);
// 链表环交点
Node* getCircleUnitNode(Node *head);
// 带环链表 环上元素个数
int numitemOfCirclrLink(Node *head);

@end

NS_ASSUME_NONNULL_END
