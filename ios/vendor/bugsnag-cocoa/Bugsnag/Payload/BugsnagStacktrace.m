//
//  BugsnagStacktrace.m
//  Bugsnag
//
//  Created by Jamie Lynch on 06/04/2020.
//  Copyright © 2020 Bugsnag. All rights reserved.
//

#import "BugsnagStacktrace.h"

#import "BSGKeys.h"
#import "BugsnagStackframe+Private.h"

BSG_OBJC_DIRECT_MEMBERS
@implementation BugsnagStacktrace

+ (instancetype)stacktraceFromJson:(NSArray<NSDictionary *> *)json {
    BugsnagStacktrace *trace = [BugsnagStacktrace new];
    NSMutableArray *data = [NSMutableArray new];

    if (json != nil) {
        for (NSDictionary *dict in json) {
            BugsnagStackframe *frame = [BugsnagStackframe frameFromJson:dict];

            if (frame != nil) {
                [data addObject:frame];
            }
        }
    }
    trace.trace = data;
    return trace;
}

- (instancetype)initWithTrace:(NSArray<NSDictionary *> *)trace
                 binaryImages:(NSArray<NSDictionary *> *)binaryImages {
    if ((self = [super init])) {
        _trace = [NSMutableArray new];

        for (NSDictionary *obj in trace) {
            BugsnagStackframe *frame = [BugsnagStackframe frameFromDict:obj withImages:binaryImages];

            if (frame != nil && [self.trace count] < 200) {
                [self.trace addObject:frame];
            }
        }
    }
    return self;
}

@end
