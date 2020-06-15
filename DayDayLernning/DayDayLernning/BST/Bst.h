//
//  Bst.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/21.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 二叉树
typedef struct BstNode {
    struct BstNode *rchild;
    struct BstNode *lchild;
    int data;
}BstNode, *BstTree;

@interface Bst : NSObject

void init_bst(void) ;// 初始化 根节点
void destroy_bst(void) ;// 销毁 二叉树
BstTree init_bstNode(int data);// 初始化 二叉树节点
void destroy_bstNode(BstTree node);// 销毁 二叉树节点

/**
 二叉树深度优先遍历：
    借助栈，完成遍历
 前(先)序遍历 - 根->左->右
 中序遍历 - 左->根->右
 后序遍历 - 左->右->根
 -------------------
 二叉树广度优先遍历：
    借助队列，完成遍历
 */

//二叉树的先序遍历算法
void bstTree_preorder(BstTree p);
//二叉树的中序遍历
void bstTree_inorder(BstTree p);
//二叉树的后序遍历
void bstTree_postorder(BstTree p);
//二叉树搜索
BstTree search_bst(BstTree p, int value);

/// 二叉树最小公共子树
BstTree lowestCommenAncestor(BstTree root, BstTree p, BstTree q);

@end

NS_ASSUME_NONNULL_END
