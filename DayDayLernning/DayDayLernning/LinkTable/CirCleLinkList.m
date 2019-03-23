//
//  CirCleLinkList.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/20.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "CirCleLinkList.h"

@implementation CirCleLinkList

CircleList initCircleList() {
    CircleList head = (CircleList)malloc(sizeof(CircleNode));
    if (head == NULL) {
        printf("初始化失败\n");
        exit(1);
    }
    
    head->next = head;
    return head;
}

CircleList initCircleNode(int data) {
    CircleList node = (CircleList)malloc(sizeof(CircleNode));
    if (node == NULL) {
        printf("初始化失败\n");
        exit(1);
    }
    
    node->data = data;
    node->next = NULL;
    
    return node;
}

bool isCircleListEmpty(CircleList head){
    if (head == NULL) {
        return false;
    }
    
    if (head->next == head) {
        return true;
    }
    return false;
}

@end
