//
//  ViewController.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/18.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ViewController.h"
#import "Sort_C.h"
#import "LinkTable/SingleLinkTable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //singleLink();
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
    Node *head = initSingleLinkTable();
    Node *node_a = NULL;
    Node *node_b = NULL;
    
    for (int i = 12; i>0; i--) {
        Node *pNode = initNode(i);
        if (i == 12) {
            node_a = pNode;
        }
        if (i == 6) {
            node_b  = pNode;
        }
        insertNode(head, pNode);
    }
    
    //构造 带环链表
    node_a->next = node_b;
    
    if (linkIsCircle(head)) {
        printf("有环\n");
        Node *circleNode = getCircleUnitNode(head);
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


@end
