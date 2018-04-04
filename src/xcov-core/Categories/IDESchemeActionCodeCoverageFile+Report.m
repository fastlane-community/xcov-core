//
//  Created by Andrei Raifura on 11/12/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageFile+Report.h"
#import "DVTSourceFileLineCoverageData+Report.h"

@implementation NSObject (IDESchemeActionCodeCoverageFile)

- (NSArray *)IDESchemeActionCodeCoverageFile_convertFunctionsToDictionaries {
    NSMutableArray *functions = [NSMutableArray array];
    
    for (NSObject *function in [self performSelector:@selector(functions)]) {
        NSDictionary *dictionary = @{@"coverage": [function performSelector:@selector(lineCoverage)],
                                     @"name": [function performSelector:@selector(name)]};
        [functions addObject:dictionary];
    }
    
    return [NSArray arrayWithArray:functions];
}

@end
