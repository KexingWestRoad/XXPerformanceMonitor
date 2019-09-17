//
//  XXTask.h
//  Pods-XXPerformanceMonitor_Example
//
//  Created by Rock Lobster on 2019/9/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// The XXTask class defines the background.
@interface XXTask : NSObject

/// Perform task in background.
- (void)performTask:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
