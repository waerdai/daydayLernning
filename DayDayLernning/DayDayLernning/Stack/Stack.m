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

void push(Node *pNode) {
    insertNode(_linkList, pNode);
}

Node *pop() {
    Node *pNode = _linkList->next;
    _linkList->next = pNode->next;
    pNode->next = NULL;
    return pNode;
}

Node *peek() {
    return _linkList->next;
}


@end
