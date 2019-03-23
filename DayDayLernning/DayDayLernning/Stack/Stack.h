//
//  Stack.h
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/20.
//  Copyright © 2019 wei zhang. All rights reserved.
//
#import "SingleLinkTable.h"

NS_ASSUME_NONNULL_BEGIN
// 栈 后进先出
@interface Stack : NSObject

void push(Node *pNode);// 入栈
Node *pop(void);// 出栈 并删除元素
Node *peek(void);// 出栈 不删除元素

@end

NS_ASSUME_NONNULL_END
