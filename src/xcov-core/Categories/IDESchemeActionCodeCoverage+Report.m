//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverage+Report.h"
#import "IDESchemeActionCodeCoverageTarget+Report.h"

@implementation NSObject (IDESchemeActionCodeCoverage)

- (NSDictionary *)IDESchemeActionCodeCoverage_convertToDictionaryIncludingLines:(BOOL)includeLines {
    NSMutableArray *targets = [NSMutableArray array];
    
    for (NSObject *target in [self performSelector:@selector(codeCoverageTargets)]) {
        [targets addObject:[target IDESchemeActionCodeCoverageTarget_convertToDictionaryIncludingLines:includeLines]];
    }
    
    return @{@"targets": targets};
}

@end
