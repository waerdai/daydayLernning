//
//  Stack.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/20.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "Stack.h"

@implementation Stack

SigLinkList _linkList;
void initStack() {
    _linkList = initSingleLinkTable();
}

void destroy_stack() {
    if (_linkList == NULL) {
        return;
    }
    distroyLink(_linkList);
}

void push(LinkNode *pLinkNode) {
    if (_linkList == NULL) {
        return;
    }
    insertLinkNode(_linkList, pLinkNode);
}

LinkNode *pop() {
    if (_linkList == NULL) {
        return _linkList;
    }
    LinkNode *pLinkNode = _linkList->next;
    _linkList->next = pLinkNode->next;
    pLinkNode->next = NULL;
    return pLinkNode;
}

LinkNode *peek() {
    if (_linkList == NULL) {
        return _linkList;
    }
    return _linkList->next;
}

bool stack_isEmpty() {
    return link_isempty(_linkList);
}

@end
