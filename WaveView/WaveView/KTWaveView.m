//
//  KTWaveView.m
//  WaveView
//
//  Created by Kuntanury on 16/8/24.
//  Copyright © 2016年 Kuntanury. All rights reserved.
//

#import "KTWaveView.h"

#define KTWAVE_SHAPELAYER @"KTShapeLayer"
#define KTWAVE_MAX_HEIGHT @"KTWaveMaxHeight"
#define KTWAVE_MIN_HEIGHT @"KTWaveMinHeight"
#define KTWAVE_WIDTH @"KTWaveWidth"
#define KTWAVE_SPEED @"KTWaveSpeed"
#define KTWAVE_COLOR @"KTWaveColor"

#define KTWAVE_OFFSET @"KTWaveOffet"

@implementation KTWaveView {
    CADisplayLink *_link;
    NSMutableArray *waveMutableArray;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        waveMutableArray = [NSMutableArray arrayWithCapacity:0];
        
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(wave)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

-(void) addWaveViewWithMaxHeight:(CGFloat)waveMaxHeight MinHeight:(CGFloat)waveMinHeight WaveWidth:(CGFloat)waveWidth WaveSpeed:(CGFloat)waveSpeed WaveColor:(UIColor *)waveColor WaveOffset:(CGFloat)waveOffset{
    
    CAShapeLayer *wave;
    wave = [CAShapeLayer layer];
    wave.opacity = 0.5;
    wave.frame = self.bounds;
    [self.layer addSublayer:wave];
    
    NSMutableDictionary *waveParamsDic = [NSMutableDictionary dictionaryWithCapacity:0];
    [waveParamsDic setObject:[NSNumber numberWithFloat:waveMaxHeight?:20] forKey:KTWAVE_MAX_HEIGHT];
    [waveParamsDic setObject:[NSNumber numberWithFloat:waveMinHeight?:5] forKey:KTWAVE_MIN_HEIGHT];
    [waveParamsDic setObject:[NSNumber numberWithFloat:waveWidth?:self.frame.size.width] forKey:KTWAVE_WIDTH];
    [waveParamsDic setObject:[NSNumber numberWithFloat:waveSpeed?:5] forKey:KTWAVE_SPEED];
    [waveParamsDic setObject:waveColor?:[UIColor colorWithWhite:0 alpha:0.2] forKey:KTWAVE_COLOR];
    [waveParamsDic setObject:wave forKey:KTWAVE_SHAPELAYER];

    [waveParamsDic setObject:[NSNumber numberWithFloat:waveOffset?:5] forKey:KTWAVE_OFFSET];
    
    [waveMutableArray addObject:waveParamsDic];
}

- (void)wave
{
    static int j = 0;
    if (j < waveMutableArray.count) {
        
        NSMutableDictionary *waveParamsDic = waveMutableArray[j];

        NSNumber *waveMaxHeightObject = [waveParamsDic objectForKey:KTWAVE_MAX_HEIGHT];
        CGFloat waveMaxHeight = waveMaxHeightObject.floatValue;
        
        NSNumber *waveMinHeightObject = [waveParamsDic objectForKey:KTWAVE_MIN_HEIGHT];
        CGFloat waveMinHeight = waveMinHeightObject.floatValue;
        
        NSNumber *waveWidthObject = [waveParamsDic objectForKey:KTWAVE_WIDTH];
        CGFloat waveWidth = waveWidthObject.floatValue;
        
        NSNumber *waveSpeedObject = [waveParamsDic objectForKey:KTWAVE_SPEED];
        CGFloat waveSpeed = waveSpeedObject.floatValue;
        
        NSNumber *waveOffsetObject = [waveParamsDic objectForKey:KTWAVE_OFFSET];
        CGFloat waveOffset = waveOffsetObject.floatValue;
        UIColor *waveColor = (UIColor *)[waveParamsDic objectForKey:KTWAVE_COLOR];

        CAShapeLayer *wave = [waveParamsDic objectForKey:KTWAVE_SHAPELAYER];

        waveOffset += waveSpeed;
        
        waveOffsetObject = [NSNumber numberWithFloat:waveOffset];
        [waveParamsDic setObject:waveOffsetObject forKey:KTWAVE_OFFSET];
        [waveMutableArray replaceObjectAtIndex:j withObject:waveParamsDic];
    
        CGMutablePathRef pathRef = CGPathCreateMutable();
        CGPathMoveToPoint(pathRef, NULL, 0, waveMinHeight);
        
        for (CGFloat i = 0.0; i < self.frame.size.width; i ++) {
            
            CGFloat y = waveMinHeight*sinf(0.5*M_PI*i/waveWidth + 3*waveOffset*M_PI/waveWidth + M_PI/4) + waveMaxHeight;
            
            CGPathAddLineToPoint(pathRef, NULL, i, y);
        }
        
        CGPathAddLineToPoint(pathRef, NULL, self.frame.size.width, self.frame.size.height);
        CGPathAddLineToPoint(pathRef, NULL, 0, self.frame.size.height);
        CGPathCloseSubpath(pathRef);
        
        wave.path = pathRef;
        
        wave.fillColor = waveColor.CGColor;
        
        CGPathRelease(pathRef);
        
        j ++;
        if (j == waveMutableArray.count) {
            j = 0;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
