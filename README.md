# KTWaveView

>交错波浪线，具有较高的自定义性。

==============
### 核心方法

```
-(void) addWaveViewWithMaxHeight:(CGFloat)waveMaxHeight MinHeight:(CGFloat)waveMinHeight WaveWidth:(CGFloat)waveWidth WaveSpeed:(CGFloat)waveSpeed WaveColor:(UIColor *)waveColor WaveOffset:(CGFloat)waveOffset;
```

### 使用示例
```
KTWaveView *waveView = [[KTWaveView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];

[waveView addWaveViewWithMaxHeight:100 MinHeight:20 WaveWidth:self.view.bounds.size.width WaveSpeed:2 WaveColor:[UIColor blueColor] WaveOffset:0];

[waveView addWaveViewWithMaxHeight:80 MinHeight:20 WaveWidth:self.view.bounds.size.width WaveSpeed:3 WaveColor:[UIColor yellowColor] WaveOffset:1];

[self.view addSubview:waveView];
```
### 已知问题
> 1.多条波浪线会有卡顿现象（数组数据交换导致）

> 2.波浪参数影响不对（数学不好导致）

> 3.bug修复时间问题（拖延症晚期导致）
