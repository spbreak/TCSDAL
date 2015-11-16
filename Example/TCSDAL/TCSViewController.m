//
//  TCSViewController.m
//  TCSDAL
//
//  Created by spbreak on 11/14/2015.
//  Copyright (c) 2015 spbreak. All rights reserved.
//

#import "TCSViewController.h"
#import "TCSDAL.h"

@interface TCSViewController ()

@end

@implementation TCSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSString *str=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"Frameworks/TCSDAL.framework/TCSDAL.bundle"];
//    NSBundle *bundle=[NSBundle bundleWithPath:str];
//    NSString *strPath=[[bundle resourcePath]stringByAppendingPathComponent:@"teacherofcomputesurname.sqlite"];
//    NSLog(@"path:%@",str);
//    NSLog(@"strPath:%@",strPath);
    NSArray *arr=[TCSDAL getManyOfTable:@"name" withWhere:nil withArrField:@[@"name"]];
    NSLog(@"%@",[[NSBundle mainBundle]resourcePath]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
