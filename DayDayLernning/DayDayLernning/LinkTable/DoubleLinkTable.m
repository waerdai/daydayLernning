//
//  DoubleLinkTable.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/19.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "DoubleLinkTable.h"

@implementation DoubleLinkTable

DuLinkList initLinkList() {
    DuLinkList head = (DuLinkList)malloc(sizeof(DuLNode));
    if (head == NULL) {
        printf("初始化失败\n");
        exit(1);
    }
    
    head->next = head;
    head->prior = head;
    
    return head;
}

DuLinkList initDulNode(int data) {
    DuLinkList node = (DuLinkList)malloc(sizeof(DuLNode));
    if (node == NULL) {
        printf("初始化失败\n");
        exit(1);
    }
    
    node->data = data;
    node->next = NULL;
    node->prior = NULL;
    
    return node;
}

void insert(DuLinkList head,int data,int index) {
    if (head == NULL) {
        return;
    }
    if (index == 0 || index > (listLength(head))) {
        return;
    }
    
    DuLinkList pNode = initDulNode(data);
    DuLinkList indexNode = getElemWithIndex(head, index);
    DuLinkList priorNode = indexNode->prior;
    
    priorNode->next = pNode;
    pNode->prior = priorNode;
    
    priorNode->next = indexNode;
    indexNode->prior = priorNode;
}

// 正序查找
DuLinkList getElemWithData(DuLinkList head, int data) {
    DuLinkList pNode = head->next;
    while (pNode != head) {
        if (pNode->data == data) {
            break;
        }
        
        pNode = pNode->next;
    }
    return pNode;
}

// 逆序查找
DuLinkList backToElemWithData(DuLinkList head, int data) {
    DuLinkList pNode = head->prior;
    while (pNode != head) {
        if (pNode->data == data) {
            break;
        }
        
        pNode = pNode->prior;
    }
    return pNode;
}

DuLinkList getElemWithIndex(DuLinkList head, int index) {
    if (index == 0) {
        return head;
    }
    
    if (index > (listLength(head))) {
        return head;
    }
    
    DuLinkList pNode = head->next;
    int current = 1;
    while (pNode != head) {
        if (current == index) {
            break;
        }
        current++;
        pNode = pNode->next;
    }
    return pNode;
}

void deleteElem(DuLinkList head, DuLinkList node) {
    if (head == NULL) {
        return;
    }
    if (node == NULL) {
        return;
    }
    
    DuLinkList pNode = node->prior;
    DuLinkList qNode = node->next;
    
    pNode->next = qNode;
    qNode->prior = pNode;
    
    free(node);
    node = NULL;
}

int listLength(DuLinkList head) {
    DuLinkList pNode = head->next;
    int count = 0;
    while (pNode != head) {
        count++;
        pNode = pNode->next;
    }
    return count;
}

bool isEmpty(DuLinkList head){
    if (head == NULL) {
        return false;
    }
    
    if ((head->next == head) && (head->prior == head)) {
        return true;
    }
    return false;
}

@end
