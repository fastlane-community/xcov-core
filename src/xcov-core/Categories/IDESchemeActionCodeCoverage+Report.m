//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverage+Report.h"
#import "IDESchemeActionCodeCoverageTarget+Report.h"

@implementation IDESchemeActionCodeCoverage (Report)

- (NSDictionary *)convertToDictionaryIncludingLines:(BOOL)includeLines {
    NSMutableArray *targets = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageTarget *target in self.codeCoverageTargets) {
        [targets addObject:[target convertToDictionaryIncludingLines:includeLines]];
    }
    
    return @{@"targets": targets};
}

@end
