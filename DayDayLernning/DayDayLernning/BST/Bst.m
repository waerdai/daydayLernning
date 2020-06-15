//
//  Bst.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/21.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "Bst.h"
#import "Stack.h"

@implementation Bst

BstTree _bst;
void init_bst() {
    _bst = init_bstNode(-1);
    initStack();// 初始化栈 用于非递归遍历二叉树
}

BstTree init_bstNode(int data) {
    BstTree tree = (BstTree)malloc(sizeof(BstNode));
    if (tree == NULL) {
        printf("创建失败\n");
        exit(1);
    }
    tree->data = data;
    tree->lchild = NULL;
    tree->rchild = NULL;
    return tree;
}

void destroy_bstNode(BstTree node) {
    if (node == NULL) {
        return;
    }
    free(node);
    node = NULL;
}

void destroy_bst() {
    
}

// 插入二叉树 递归版
bool insert_bstNode(BstTree root,BstTree node) {
    if (root == NULL) {
        return false;
    }
    if (root->data > node->data) {
        insert_bstNode(root->lchild, node);
        return true;
    }else if (root->data < node->data) {
        insert_bstNode(root->rchild, node);
        return true;
    }
    return false;
}
// 非递归版
bool insert_bstNode2(BstTree root,BstTree node) {
    if (root == NULL) {
        return false;
    }
    BstTree present = NULL;
    BstTree current = root;
    while (current) {
        present = current;
        if (current->data > node->data) {
            current = current->lchild;
        }else if (current->data < node->data) {
            current = current->rchild;
        }else {
            return false;
        }
    }
    
    if (present->data > node->data) {
        present->lchild = node;
    }else if (present->data < node->data) {
        present->rchild = node;
    }
    
    return true;
}

void visitBst(BstTree p);
//二叉树的先序遍历算法
void bstTree_preorder(BstTree p) {
    if(p != NULL)
    {
        visitBst(p);
        bstTree_preorder(p->lchild);
        bstTree_preorder(p->rchild);
    }
}

//二叉树 非递归先序遍历
void bstTree_preorder2(BstTree root) {
    BstTree pNode = root;
    
    while (pNode != NULL || !stack_isEmpty()) {
        if (pNode != NULL) {
            visitBst(pNode);// 访问跟节点
            push(pNode);
            pNode = pNode->lchild;// 左节点入栈，直至左节点为空
        } else {
            BstTree node = pop();// 左节点为空，转而访问右节点
            pNode = node->rchild;
        }
    }
}

//二叉树的中序遍历
void bstTree_inorder(BstTree p) {
    if(p != NULL)
    {
        bstTree_inorder(p->lchild);
        visitBst(p);
        bstTree_inorder(p->rchild);
    }
}

//二叉树 非递归中序遍历
void bstTree_inorder2(BstTree root) {
    BstTree pNode = root;
    
    while (pNode != NULL || !stack_isEmpty()) {
        if (pNode != NULL) {
            push(pNode);
            pNode = pNode->lchild;
        } else {
            BstTree node = pop();// 做节点为空,此时出栈的为根节点，访问之，转而访问右节点
            visitBst(node);
            pNode = node->rchild;
        }
    }
}

//二叉树的后序遍历
void bstTree_postorder(BstTree p) {
    if(p != NULL)
    {
        bstTree_postorder(p->lchild);
        bstTree_postorder(p->rchild);
        visitBst(p);
    }
}

//二叉树 非递归后序遍历
void bstTree_postorder2(BstTree root) {
    /***
     非递归二叉树后序遍历，对于当前节点p
     若p的左右节点都被访问过，或者左右节点
     都为空，则访问p，否则，若有右节点右节点入栈
     若有左节点，左节点入栈
     */
    
    BstTree pNode = NULL;// 当前节点
    BstTree prevNode = NULL;// 前一节点
    
    push(root);
    while (!stack_isEmpty()) {
        pNode = peek();
        if ((pNode->lchild == NULL && pNode->rchild == NULL) || (prevNode!=NULL&&(prevNode==pNode->lchild||prevNode==pNode->rchild))) {// 满足条件，访问
            visitBst(pNode);
            pop();
            prevNode = pNode;
        }
        else if (pNode->rchild) {/* 之所以，先入栈右节点，再入栈左节点，是为了保证先访问左节点再访问右节点*/
            push(pNode->rchild);
        }
        else if (pNode->lchild) {
            push(pNode->lchild);
        }
    }
}

void visitBst(BstTree p) {
    printf("\n");
    printf("节点为：%d", p->data);
}

BstTree search_bst(BstTree p, int value) {
    BstTree pNode = p;
    while (pNode) {
        if (value > pNode->data) {
            pNode = pNode->rchild;
        }
        else if (value < pNode->data) {
            pNode = pNode->lchild;
        }
        else {
            break;
        }
    }
    return pNode;
}

/// 二叉树最小公共子树
BstTree lowestCommenAncestor(BstTree root, BstTree p, BstTree q) {
    while (root) {
        if (p->data < root->data && q->data < root->data) {
            root = root->lchild;
        }
        else if (p->data > root->data && q->data > root->data) {
            root = root->rchild;
        }
        else {
            break;
        }
    }
    return root;
}

@end
