//
//  XXTask.m
//  Pods-XXPerformanceMonitor_Example
//
//  Created by Rock Lobster on 2019/9/17.
//

#import "XXTask.h"

@interface XXTask ()
@property(nonatomic,strong)dispatch_queue_t taskQueue;
@end

@implementation XXTask

- (instancetype)init {
    if (self = [super init]) {
        dispatch_queue_attr_t queueAttributes = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_BACKGROUND, 0);
        _taskQueue = dispatch_queue_create("com.liaodengke.performaceMonitor", queueAttributes);
    }
    return self;
}

- (void)performTask:(dispatch_block_t)block {
    if (block && _taskQueue) {
        dispatch_async(_taskQueue, block);
    }
}

@end
