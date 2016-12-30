//
//  Created by Andrei Raifura on 11/12/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageFile+Report.h"

#import "IDESchemeActionCodeCoverageFunction.h"
#import "DVTSourceFileLineCoverageData+Report.h"

@implementation IDESchemeActionCodeCoverageFile (Report)

- (NSArray *)convertFunctionsToDictionaries {
    NSMutableArray *functions = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFunction *function in self.functions) {
        NSDictionary *dictionary = @{@"coverage": function.lineCoverage,
                                     @"name": function.name};
        [functions addObject:dictionary];
    }
    
    return [NSArray arrayWithArray:functions];
}

- (NSArray *)convertLinesToDictionaries {
    NSUInteger capacity = [self.lines count];
    NSMutableArray *dictionaries = [[NSMutableArray alloc] initWithCapacity:capacity];
    
    for (DVTSourceFileLineCoverageData *line in self.lines) {
        [dictionaries addObject:[line convertToDictionary]];
    }
    
    return [NSArray arrayWithArray:dictionaries];
}

@end
