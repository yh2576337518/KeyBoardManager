//
//  ViewController.m
//  KeyBoardManager
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import "ViewController.h"
#import "KeyBoardSender.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *upField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *downField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.upField.MoveView = self.view;
    self.upField.KeyBoardDistance = 50;
    
    self.downField.MoveView = self.view;
    self.downField.KeyBoardDistance = 15;
    
    self.textView.MoveView = self.view;
    self.textView.KeyBoardDistance = 30;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
