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
Node* initSingleLinkTable() {
    Node *head = (Node *)malloc(sizeof(Node));
    if (head == NULL) {
        printf("初始化链表失败！");
        exit(1);
    }
    head->next = NULL;
    head->data = -1;
    return head;
}

// 初始化 节点
Node* initNode(int data) {
    Node *node = (Node *)malloc(sizeof(Node));
    if (node == NULL) {
        printf("初始化节点失败！");
        exit(1);
    }
    node->data = data;
    node->next = NULL;
    return node;
}

// 头插法
void insertNode(Node *head,Node *node) {
    if (head == NULL) {
        return;
    }
    if (node == NULL) {
        return;
    }
    
    node->next = head->next;
    head->next = node;
}

// 链表元素个数
int lengthOfSingleLink(Node *head) {
    if (head == NULL) {
        return 0;
    }
    if (head->next == NULL) {
        return 0;
    }
    
    int num = 0;
    Node *p = head->next;
    while (p != NULL) {
        num++;
        p = p->next;
    }
    return num;
}

// 查找 节点
Node* getNode(Node *head, int data) {
    if (head == NULL) {
        printf("异常");
        exit(1);
    }
    
    Node *p = head->next;
    while (p != NULL) {
        if (p->data == data) {
            break;
        }
        p = p->next;
    }
    
    return p;
}

int localOfNode(Node *head, int data) {
    if (head == NULL) {
        return -1;
    }
    
    int index = 0;
    Node *p = head->next;
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

void deleteNode(Node *head, int data) {
    Node *prev = head;
    // 寻找当前节点 前驱
    while (prev != NULL && prev->next->data != data) {
        prev = prev->next;
    }
    
    Node *currentNode = prev->next;
    if (currentNode != NULL) {
        prev->next = currentNode->next;
        free(currentNode);
        currentNode = NULL;
    }
}

void printfSingleLink(Node *head) {
    printf("链表元素如下\n");
    Node *p = head->next;
    while (p != NULL) {
        printf("node->data:%d", p->data);
        printf("\n");
        p = p->next;
    }
}

void reverseLink(Node *head) {
    Node *curNode = head->next;//当前节点
    Node *prevNode = NULL;//前驱节点
    Node *pHead = NULL;//头节点
    
    while (curNode!=NULL) {
        Node *pNext = curNode->next;
        if (pNext==NULL) {
            pHead = curNode;
        }
        // 反转链表
        curNode->next = prevNode;
        
        // 驱动迭代
        prevNode = curNode;
        curNode = pNext;
    }
    head->next = pHead;
}

// 链表是否有交点
bool singleLinkIsUnit(Node *head_a,Node *head_b) {
    Node *pNode = head_a->next;
    Node *qNode = head_b->next;
    
    while (pNode != NULL) {
        pNode = pNode->next;
    }
    
    while (qNode != NULL) {
        qNode = qNode->next;
    }
    
    if (pNode == qNode) {
        return true;
    }
    return false;
}

// 返回链表的交点
Node* getLinkUnitNode(Node *head_a,Node *head_b) {
    int a = lengthOfSingleLink(head_a);
    int b = lengthOfSingleLink(head_b);
    
    Node *pNode = head_a->next;
    Node *qNode = head_b->next;
    
    int count = abs(b-a);
    if (a > b) {
        while (count != 0 && pNode != NULL) {
            count--;
            pNode = pNode->next;
        }
    }
    else if (a < b) {
        while (count != 0 && qNode != NULL) {
            count--;
            qNode = qNode->next;
        }
    }
    
    while (pNode != NULL && qNode != NULL) {
        if (pNode == qNode) {
            break;
        }
        pNode = pNode->next;
        qNode = qNode->next;
    }
    return pNode;
}

Node* getCircleUnitNode(Node *head) {
    Node *low = head->next;
    Node *fast = low->next;
    
    bool isCircle = false;
    while (low!=NULL && fast!=NULL) {
        if (low == fast) {
            isCircle = true;
            break;
        }
        
        low = low->next;
        fast = fast->next->next;
    }
    
    Node *pHead = NULL;
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

int numitemOfCirclrLink(Node *head) {
    // 求快慢指针 交点
    Node *low = head->next;
    Node *fast = low->next;
    
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

bool linkIsCircle(Node *head) {
    Node *low = head->next;
    Node *fast = low->next;
    
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
