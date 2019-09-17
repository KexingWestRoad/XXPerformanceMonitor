//
//  XXPerformanceFPS.m
//  Pods-XXPerformanceMonitor_Example
//
//  Created by Rock Lobster on 2019/9/17.
//

#import "XXPerformanceFPS.h"
#import <UIKit/UIKit.h>

@interface XXPerformanceFPS ()

@property(nonatomic,strong)CADisplayLink *displayLink;
@property(nonatomic,assign)BOOL isFPSMonitorEnable;
@property(nonatomic,assign)BOOL isFPSMonitorStarted;
@property(nonatomic,assign)NSUInteger frameCount;
@property(nonatomic,assign)CFTimeInterval fpsMonitorStartTime;
@property(nonatomic,copy)NSString *fpsMonitorPage;

@end

@implementation XXPerformanceFPS

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTrace)];
        [_displayLink setPaused:YES];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

- (void)displayLinkTrace {
    _frameCount++;
}

- (void)startFPSMonitor {
    if (![NSThread isMainThread]) {
        NSAssert(0, @"startMonitor 必须在主线程中调用");
        return;
    }
    if ([self.displayLink isPaused]) {
        [self.displayLink setPaused:NO];
    }
    _frameCount = 0;
    _fpsMonitorStartTime = CACurrentMediaTime();
    _isFPSMonitorStarted = YES;
}

- (void)stopFPSMonitor {
    if (![NSThread isMainThread]) {
        NSAssert(0, @"stopFPSMonitor 必须在主线程中调用");
        return;
    }
    if (_isFPSMonitorStarted) {
        CFTimeInterval fpsMonitorStopTime = CACurrentMediaTime();
        CFTimeInterval timeSpan = fpsMonitorStopTime - _fpsMonitorStartTime;
        float avgFPS = _frameCount / timeSpan;
        NSLog(@"avgFPS = %f",avgFPS);
    }
}

- (void)dealloc {
    [_displayLink setPaused:YES];
    [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

@end
