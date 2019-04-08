//
//  Tree.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/23.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 森林
typedef struct TreeNode {
    struct TreeNode** childs;// 二维指针当数组用，每一元素存储（Node*）
    int count;// 子节点个数
    int data;
}TreeNode, *Trees;

@interface Tree : NSObject

// 初始化 根节点
Trees init_TreeRoot(int data);
// 初始化 节点
Trees init_TreeNode(int data);
// 插入节点
bool insert_child(Trees root,Trees node);
// 销毁森林
void distroy_TreeRoot(Trees node);
// 销毁森林节点
void distroy_TreeNode(Trees node) ;
int tree_dep(Trees tree);//森林深度
void enuamTreeChilds(Trees tree);//遍历森林

@end

NS_ASSUME_NONNULL_END
