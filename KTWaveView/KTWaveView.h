//
//  KTWaveView.h
//  WaveView
//
//  Created by Kuntanury on 16/8/24.
//  Copyright © 2016年 Kuntanury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTWaveView : UIView

-(void) addWaveViewWithMaxHeight:(CGFloat)waveMaxHeight MinHeight:(CGFloat)waveMinHeight WaveWidth:(CGFloat)waveWidth WaveSpeed:(CGFloat)waveSpeed WaveColor:(UIColor *)waveColor WaveOffset:(CGFloat)waveOffset;

@end
