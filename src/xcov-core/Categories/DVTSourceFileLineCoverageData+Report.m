//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "DVTSourceFileLineCoverageData+Report.h"
#import "DVTSourceFileCodeCoverageRange.h"

@implementation DVTSourceFileLineCoverageData (Report)

- (NSDictionary *)convertToDictionary {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    dictionary[@"executable"] = @(self.isExecutable);
    dictionary[@"executionCount"] = @(self.executionCount);
    
    if ([self shouldAddSubranges]) {
        dictionary[@"ranges"] = [self convertRangesIntoDictionaries];
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

#pragma mark - Private Methods

- (NSArray *)convertRangesIntoDictionaries {
    NSUInteger capacity = [self.subRanges count];
    NSMutableArray *dictionaries = [[NSMutableArray alloc] initWithCapacity:capacity];
    
    for (DVTSourceFileCodeCoverageRange *range in self.subRanges) {
        NSDictionary *dictionary = @{@"location": @(range.column),
                                     @"length": @(range.length),
                                     @"executionCount": @(range.executionCount)};
        [dictionaries addObject:dictionary];
    }
    
    return [NSArray arrayWithArray:dictionaries];
}

- (BOOL)shouldAddSubranges {
    if (self.subRanges == nil) { return NO; }
    
    // If there is one range, we asume the entire line was covered
    if (self.subRanges.count == 1) { return NO; }
    
    return YES;
}

@end
