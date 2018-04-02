//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "DVTSourceFileLineCoverageData+Report.h"

@implementation NSObject (DVTSourceFileLineCoverageData)

- (NSDictionary *)DVTSourceFileLineCoverageData_convertToDictionary {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    dictionary[@"executable"] = @(((BOOL) [self performSelector:@selector(isExecutable)]));
    dictionary[@"executionCount"] = @(((unsigned long long) [self performSelector:@selector(executionCount)]));
    
    if ([self shouldAddSubranges]) {
        dictionary[@"ranges"] = [self convertRangesIntoDictionaries];
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

#pragma mark - Private Methods

- (NSArray *)convertRangesIntoDictionaries {
    NSUInteger capacity = (NSUInteger)[[self performSelector:@selector(subRanges)] performSelector:@selector(count)];
    NSMutableArray *dictionaries = [[NSMutableArray alloc] initWithCapacity:capacity];
    
    for (NSObject *range in [self performSelector:@selector(subRanges)]) {
        NSDictionary *dictionary = @{@"location": @(((unsigned long long) [range performSelector:@selector(columnn)])),
                                     @"length": @(((unsigned long long) [range performSelector:@selector(length)])),
                                     @"executionCount": @(((unsigned long long) [range performSelector:@selector(executionCount)]))};
        [dictionaries addObject:dictionary];
    }
    
    return [NSArray arrayWithArray:dictionaries];
}

- (BOOL)shouldAddSubranges {
    if ([self performSelector:@selector(subRanges)] == nil) { return NO; }
    
    // If there is one range, we asume the entire line was covered
    if (((NSUInteger)[[self performSelector:@selector(subRanges)] performSelector:@selector(count)]) == 1) { return NO; }
    
    return YES;
}

@end
