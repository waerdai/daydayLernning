//
//  DemoVC.m
//  DayDayLernning
//
//  Created by wei zhang on 2019/3/22.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "DemoVC.h"

typedef void(^MyBlock)(void);
@interface DemoVC ()
@property (nonatomic, copy) MyBlock myBlock;
@property (nonatomic) NSInteger pointer;
@property (nonatomic) NSString *name;
@end

@implementation DemoVC

- (void)dealloc {
    NSLog(@"DemoVC dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = @"A";
    __block NSInteger i = 1;
    
    void(^block)(void) = ^{
        NSLog(@"str:%@-i:%ld", str,(long)i);
    };
    str = @"B";
    i = 2;
    
    block();
    
    self.name = @"zw";
    self.pointer = 22;
    
    self.myBlock = ^{
        // 这里其实是 self->_name
        NSLog(@"name:%@", _name);
    };
    self.myBlock();

    self.myBlock = ^{
        // 这里其实是 self->_pointer
        NSLog(@"pointer:%ld", _pointer);
    };
    self.myBlock();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
