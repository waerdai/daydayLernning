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
// base==top 栈空 top-base>=maxsize栈满
@interface Stack : NSObject

// 初始化栈
void initStack(void);

// 销毁栈
void destroy_stack(void);

void push(LinkNode *pNode);// 入栈
LinkNode *pop(void);// 出栈 并删除元素
LinkNode *peek(void);// 出栈 不删除元素

bool stack_isEmpty(void) ;// 栈为空

@end

NS_ASSUME_NONNULL_END
