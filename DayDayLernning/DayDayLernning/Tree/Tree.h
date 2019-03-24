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
}TreeNode, *BstTree;

@interface Tree : NSObject

int tree_dep(BstTree tree);//森林深度
void enuamTreeChilds(BstTree tree);//遍历森林

@end

NS_ASSUME_NONNULL_END
