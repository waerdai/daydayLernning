//
//  ViewController.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/18.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ViewController.h"
#import "Sort/Sort_C.h"
#import "AlgorithmProblem/AlgorithmProblem.h"
#import "LinkTable/SingleLinkTable.h"
#import "Tree/Tree.h"
#import "DemoVC.h"
#import <WebKit/WebKit.h>

#import "CatagoryObj/ClassA.h"
#import "CatagoryObj/ClassB.h"
#import "CatagoryObj/ClassA+Run.m"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"ViewController dealloc");
}

int fabo(int n);
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    ClassA *a = [ClassA new];
    [a run];
    
    //singleLink();
    Trees trees = init_TreeRoot(1);
    TreeNode *node = init_TreeNode(2);
    insert_child(trees, node);
    printf("trees->count:%d", trees->count);
    
    return;
    
    UIView *view1 = [UIView new];
    UIView *view2 = [UIView new];
    [view1 addSubview:view2];
    [self.view addSubview:view1];
    
    printf("maxDepth:%d", maxDepth(self.view));
    // UIWebView的delegate用assign修饰 是为了兼容非arc环境
    // WKWebView 的代理换成了 weak
    
    // 因为 supper结构体包含 reciever->子类对象 supperclass->父类
    // supper 说明SEL从父类中的开始查找
    // class为对象方法
    NSLog(@"class:%@",[self class]);
    NSLog(@"supper:%@",[super class]);
    
    // 解决三方冲突 封装一层再调用 然后给三方每一个类加上前缀
    /**
     粘包： 由于包过小，tcp采用Nagle算法对包合并，就出现了粘包
     分包：tcp分片传输丢包，导致一个包被分成多个半包，导致多次接收
     解决方式->1
        采用/r/n之类的分隔符,作为包的结尾符。出现结尾符则，分割解析，
        这样如果有粘包就人为分割了。如果没出现分隔符，就认为出现了分包，
        等待下一个包中出现分隔符，再组合成完整数据包，解析。
     解决方式->2
        自定义协议，在包上封装数据包的长度信息headL
        先解析包长度headL，再根据包长度截取数据包，
        如果包是错误包，则丢弃
     解决方式->3
        消息定长，每次截取定长消息解析
     */
}

int fabo(int n) {
    if (n == 0 || n == 1) {
        return n;
    }
    
    int first = 1;
    int second = 1;
    int third = 1;
    
    for (int i = 2; i < n; i++) {
        third = first + second;
        first = second;
        second = third;
    }
    return third;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DemoVC *demoVC = [[DemoVC alloc] init];
    [self presentViewController:demoVC animated:YES completion:nil];
}

void singleLink() {
//    Node *head = initSingleLinkTable();
//    for (int i = 2; i<6; i++) {
//        Node *pNode = initNode(i);
//        insertNode(head, pNode);
//    }
//    // 1.链表反转
//    printfSingleLink(head);
//    reverseLink(head);
//    printfSingleLink(head);
    
//    // 2.链表相交
//    Node *head_a = initSingleLinkTable();
//    Node *head_b = initSingleLinkTable();
//
//    // 插入公共节点
//    for (int i = 20; i < 23; i++) {
//        Node *pNode = initNode(i);
//        insertNode(head_a, pNode);
//        insertNode(head_b, pNode);
//    }
//
//    for (int i = 2; i<6; i++) {
//        Node *pNode = initNode(i);
//        insertNode(head_a, pNode);
//    }
//
//    for (int i = 8; i<12; i++) {
//        Node *pNode = initNode(i);
//        insertNode(head_b, pNode);
//    }
//
//    if (singleLinkIsUnit(head_a, head_b)) {
//        printf("有交点\n");
//        Node *unitNode = getLinkUnitNode(head_a, head_b);
//        printf("交点为：%d",unitNode->data);
//    }
//    else {
//        printf("没交点\n");
//    }
    
    // 3.链表有环
    LinkNode *head = initSingleLinkTable();
    LinkNode *node_a = NULL;
    LinkNode *node_b = NULL;
    
    for (int i = 12; i>0; i--) {
        LinkNode *pNode = initLinkNode(i);
        if (i == 12) {
            node_a = pNode;
        }
        if (i == 6) {
            node_b  = pNode;
        }
        insertLinkNode(head, pNode);
    }
    
    //构造 带环链表
    node_a->next = node_b;
    
    if (linkIsCircle(head)) {
        printf("有环\n");
        LinkNode *circleNode = getCircleUnitLinkNode(head);
        printf("链表环交点：%d-元素个数：%d\n",circleNode->data,numitemOfCirclrLink(head));
    }
    else {
        printf("无环\n");
    }
    
}

void sort() {
    // 1.快速排序
    int intArray[] = {1,5,6,4,2,3};
    quickSort(intArray, 0, 5);
    printf("quickSort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("quickSort:%d", intArray[i]);
        printf("\n");
    }
    
    // 2.归并排序
    int merge[] = {1,3,2,5,6,4};
    merge_sort(merge, 5);//传入 数组最后下标
    printf("merge_sort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("merge_sort:%d", merge[i]);
        printf("\n");
    }
    
    // 3.选择排序
    int selectsort[] = {1,5,6,3,2,4};
    select_sort(selectsort, 6);
    printf("selectsort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("selectsort:%d", merge[i]);
        printf("\n");
    }
    
    // 4.插入排序
    int insertsort[] = {1,5,6,3,2,4};
    insert_sort(insertsort, 6);
    printf("insertsort");
    printf("\n");
    for (int i = 0; i < 6; i++) {
        printf("insertsort:%d", merge[i]);
        printf("\n");
    }
    
}

void fibo() {
    
}

@end
