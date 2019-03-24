//
//  Tree.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/23.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "Tree.h"

@implementation Tree

void visit_Tree(BstTree node) {
    if (node == NULL) {
        return;
    }
    printf("\n");
    printf("node:%d",node->data);
}

int tree_dep(BstTree tree) {
    if (tree == NULL) {
        return 0;
    }
    
    int max = 0;
    while (tree->count) {
        BstTree pNode = tree->childs[tree->count];
        max = MAX(max, tree_dep(pNode));
        tree->count--;
    }
    
    return max + 1;
}

void enuamTreeChilds(BstTree tree) {
    if (tree == NULL) {
        return;
    }
    
    while (tree->count) {
        BstTree pNode = tree->childs[tree->count];
        visit_Tree(pNode);
        tree->count--;

        enuamTreeChilds(pNode);
    }
}

@end
