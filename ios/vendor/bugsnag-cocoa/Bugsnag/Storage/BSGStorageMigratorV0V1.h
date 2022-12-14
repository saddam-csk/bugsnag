//
//  BSGStorageMigratorV0V1.h
//  Bugsnag
//
//  Created by Karl Stenerud on 04.01.21.
//  Copyright © 2021 Bugsnag Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BSGDefines.h"

NS_ASSUME_NONNULL_BEGIN

BSG_OBJC_DIRECT_MEMBERS
@interface BSGStorageMigratorV0V1 : NSObject

+ (BOOL) migrate;

@end

NS_ASSUME_NONNULL_END
