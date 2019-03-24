//
//  SingleLinkTable.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/19.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "SingleLinkTable.h"

@implementation SingleLinkTable


/**
 初始化 链表

 @return head 链表头指针
 */
LinkNode* initSingleLinkTable() {
    LinkNode *head = (LinkNode *)malloc(sizeof(LinkNode));
    if (head == NULL) {
        printf("初始化链表失败！");
        exit(1);
    }
    head->next = NULL;
    head->data = -1;
    return head;
}

// 初始化 节点
LinkNode* initLinkNode(int data) {
    LinkNode *linkNode = (LinkNode *)malloc(sizeof(LinkNode));
    if (linkNode == NULL) {
        printf("初始化节点失败！");
        exit(1);
    }
    linkNode->data = data;
    linkNode->next = NULL;
    return linkNode;
}

// 头插法
void insertLinkNode(LinkNode *head,LinkNode *LinkNode) {
    if (head == NULL) {
        return;
    }
    if (LinkNode == NULL) {
        return;
    }
    
    LinkNode->next = head->next;
    head->next = LinkNode;
}

// 链表元素个数
int lengthOfSingleLink(LinkNode *head) {
    if (head == NULL) {
        return 0;
    }
    if (head->next == NULL) {
        return 0;
    }
    
    int num = 0;
    LinkNode *p = head->next;
    while (p != NULL) {
        num++;
        p = p->next;
    }
    return num;
}

// 查找 节点
LinkNode* getLinkNode(LinkNode *head, int data) {
    if (head == NULL) {
        printf("异常");
        exit(1);
    }
    
    LinkNode *p = head->next;
    while (p != NULL) {
        if (p->data == data) {
            break;
        }
        p = p->next;
    }
    
    return p;
}

int localOfLinkNode(LinkNode *head, int data) {
    if (head == NULL) {
        return -1;
    }
    
    int index = 0;
    LinkNode *p = head->next;
    while (p != NULL) {
        if (p->data == data) {
            break;
        }
        index++;
        p = p->next;
    }
    
    if (p == NULL) {
        return -1;
    }
    
    return index;
}

void deleteLinkNode(LinkNode *head, int data) {
    LinkNode *prev = head;
    // 寻找当前节点 前驱
    while (prev != NULL && prev->next->data != data) {
        prev = prev->next;
    }
    
    LinkNode *currentLinkNode = prev->next;
    if (currentLinkNode != NULL) {
        prev->next = currentLinkNode->next;
        free(currentLinkNode);
        currentLinkNode = NULL;
    }
}

bool link_isempty(LinkNode *head) {
    if (head == NULL) {
        return YES;
    }
    
    if (head->next == NULL) {
        return YES;
    }
    
    return NO;
}

void printfSingleLink(LinkNode *head) {
    printf("链表元素如下\n");
    LinkNode *p = head->next;
    while (p != NULL) {
        printf("LinkNode->data:%d", p->data);
        printf("\n");
        p = p->next;
    }
}

// 销毁链表
void distroyLink(LinkNode *head) {
    LinkNode *pLinkNode = head;// 用于删除
    LinkNode *qLinkNode = pLinkNode->next;// 用于驱动
    
    while (qLinkNode) {
        free(pLinkNode);
        pLinkNode = NULL;
        
        pLinkNode = qLinkNode;
        qLinkNode = qLinkNode->next;
    }
}

// 清空链表
void clearLink(LinkNode *head) {
    LinkNode *pLinkNode = head->next;// 用于删除
    distroyLink(pLinkNode);
}

void reverseLink(LinkNode *head) {
    LinkNode *curLinkNode = head->next;//当前节点
    LinkNode *prevLinkNode = NULL;//前驱节点
    LinkNode *pHead = NULL;//头节点
    
    while (curLinkNode!=NULL) {
        LinkNode *pNext = curLinkNode->next;
        if (pNext==NULL) {
            pHead = curLinkNode;
        }
        // 反转链表
        curLinkNode->next = prevLinkNode;
        
        // 驱动迭代
        prevLinkNode = curLinkNode;
        curLinkNode = pNext;
    }
    head->next = pHead;
}

// 链表是否有交点
bool singleLinkIsUnit(LinkNode *head_a,LinkNode *head_b) {
    LinkNode *pLinkNode = head_a->next;
    LinkNode *qLinkNode = head_b->next;
    
    while (pLinkNode != NULL) {
        pLinkNode = pLinkNode->next;
    }
    
    while (qLinkNode != NULL) {
        qLinkNode = qLinkNode->next;
    }
    
    if (pLinkNode == qLinkNode) {
        return true;
    }
    return false;
}

// 返回链表的交点
LinkNode* getLinkUnitLinkNode(LinkNode *head_a,LinkNode *head_b) {
    int a = lengthOfSingleLink(head_a);
    int b = lengthOfSingleLink(head_b);
    
    LinkNode *pLinkNode = head_a->next;
    LinkNode *qLinkNode = head_b->next;
    
    int count = abs(b-a);
    if (a > b) {
        while (count != 0 && pLinkNode != NULL) {
            count--;
            pLinkNode = pLinkNode->next;
        }
    }
    else if (a < b) {
        while (count != 0 && qLinkNode != NULL) {
            count--;
            qLinkNode = qLinkNode->next;
        }
    }
    
    while (pLinkNode != NULL && qLinkNode != NULL) {
        if (pLinkNode == qLinkNode) {
            break;
        }
        pLinkNode = pLinkNode->next;
        qLinkNode = qLinkNode->next;
    }
    return pLinkNode;
}

LinkNode* getCircleUnitLinkNode(LinkNode *head) {
    LinkNode *low = head->next;
    LinkNode *fast = low->next;
    
    bool isCircle = false;
    while (low!=NULL && fast!=NULL) {
        if (low == fast) {
            isCircle = true;
            break;
        }
        
        low = low->next;
        fast = fast->next->next;
    }
    
    LinkNode *pHead = NULL;
    if (isCircle) {
        pHead = head;
        while (low != pHead) {
            low = low->next;
            pHead = pHead->next;
        }
        return pHead;
    }
    return pHead;
}

int numitemOfCirclrLink(LinkNode *head) {
    // 求快慢指针 交点
    LinkNode *low = head->next;
    LinkNode *fast = low->next;
    
    bool isCircle = false;
    while (low!=NULL && fast!=NULL) {
        if (low == fast) {
            isCircle = true;
            break;
        }
        
        low = low->next;
        fast = fast->next->next;
    }
    
    int count = 0;//计数器
    // 求环上元素个数
    do
    {
        count++;
        low = low->next;
        fast=fast->next->next;
    }while(low!=fast);
    
    return count;
}

bool linkIsCircle(LinkNode *head) {
    LinkNode *low = head->next;
    LinkNode *fast = low->next;
    
    bool isCircle = false;
    while (low!=NULL && fast!=NULL) {
        if (low == fast) {
            isCircle = true;
            break;
        }
        
        low = low->next;
        fast = fast->next->next;
    }
    return isCircle;
}

@end
