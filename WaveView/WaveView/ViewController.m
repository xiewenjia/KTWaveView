//
//  ViewController.m
//  WaveView
//
//  Created by Kuntanury on 16/8/24.
//  Copyright © 2016年 Kuntanury. All rights reserved.
//

#import "ViewController.h"
#import "KTWaveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    KTWaveView *waveView = [[KTWaveView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];

    [waveView addWaveViewWithMaxHeight:100 MinHeight:20 WaveWidth:self.view.bounds.size.width WaveSpeed:2 WaveColor:[UIColor blueColor] WaveOffset:0];

    [waveView addWaveViewWithMaxHeight:80 MinHeight:20 WaveWidth:self.view.bounds.size.width WaveSpeed:3 WaveColor:[UIColor yellowColor] WaveOffset:1];
    
    waveView.backgroundColor = [UIColor whiteColor];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:waveView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
