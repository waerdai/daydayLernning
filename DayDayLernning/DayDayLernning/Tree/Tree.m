//
//  Tree.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/23.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "Tree.h"

@implementation Tree

Trees init_TreeRoot(int data) {
    return init_TreeNode(data);
}

void distroy_TreeRoot(Trees node) {
    distroy_TreeNode(node);
}

Trees init_TreeNode(int data) {
    Trees node = (Trees)malloc(sizeof(TreeNode));
    node->data = data;
    node->count = 0;
    node->childs = (Trees *)malloc(sizeof(Trees));
    return node;
}

void distroy_TreeNode(Trees node) {
    if (node == NULL || node->childs[0] == NULL) {
        free(node->childs);
        node->childs = NULL;
        
        node->count = 0;
        node->data = 0;
        free(node);
        node = NULL;
        
        return;
    }
    
    for (int i = 0; i < node->count; i++) {
        distroy_TreeNode(node->childs[i]);
    }
}

bool insert_child(Trees root,Trees node) {
    if (root == NULL || node == NULL) {
        return false;
    }
    
    root->childs[root->count] = (Trees)malloc(sizeof(TreeNode));
    if (root->childs[root->count] == NULL) {
        return false;
    }
    root->childs[root->count] = node;
    root->count++;
    return true;
}



void visit_Tree(Trees node) {
    if (node == NULL) {
        return;
    }
    printf("\n");
    printf("node:%d",node->data);
}

int tree_dep(Trees tree) {
    if (tree == NULL) {
        return 0;
    }
    
    int max = 0;
    while (tree->count) {
        Trees pNode = tree->childs[tree->count];
        max = MAX(max, tree_dep(pNode));
        tree->count--;
    }
    
    return max + 1;
}

void enuamTreeChilds(Trees tree) {
    if (tree == NULL) {
        return;
    }
    
    while (tree->count) {
        Trees pNode = tree->childs[tree->count];
        visit_Tree(pNode);
        tree->count--;

        enuamTreeChilds(pNode);
    }
}

@end
