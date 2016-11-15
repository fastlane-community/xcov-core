//
//  Created by Andrei Raifura on 11/12/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageFile+Report.h"

#import "IDESchemeActionCodeCoverageFunction.h"
#import "DVTSourceFileLineCoverageData.h"

@implementation IDESchemeActionCodeCoverageFile (DictionaryReport)

- (NSArray *)convertFunctionsToDictionaries {
    NSMutableArray *functions = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFunction *function in self.functions) {
        NSDictionary *dictionary =  @{@"coverage":function.lineCoverage, @"name":function.name};
        [functions addObject:dictionary];
    }
    
    return [NSArray arrayWithArray:functions];
}

- (NSDictionary *)linesInfo {
    return @{@"total": @(self.lines.count),
             @"executable": @(self.executableLines.count),
             @"covered": @(self.coveredLines.count)};
}

#pragma mark - Private methods

- (NSArray *)executableLines {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(DVTSourceFileLineCoverageData* line, NSDictionary *bindings) {
        return line.isExecutable;
    }];
    
    return [self.lines filteredArrayUsingPredicate: predicate];
}

- (NSArray *)coveredLines {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(DVTSourceFileLineCoverageData* line, NSDictionary *bindings) {
        return (line.executionCount > 0);
    }];
    
    return [self.lines filteredArrayUsingPredicate: predicate];
}

@end
