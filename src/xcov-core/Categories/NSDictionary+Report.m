//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "NSDictionary+Report.h"

#import "IDESchemeActionCodeCoverage.h"
#import "IDESchemeActionCodeCoverageFile.h"
#import "DVTSourceFileLineCoverageData.h"
#import "IDESchemeActionCodeCoverageTarget.h"
#import "IDESchemeActionCodeCoverageFunction.h"

@implementation NSDictionary (Report)

+ (NSDictionary*)dictionaryFromCodeCoverage:(IDESchemeActionCodeCoverage *)codeCoverage {
    NSMutableArray *targets = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageTarget *target in codeCoverage.codeCoverageTargets) {
        [targets addObject:[NSDictionary _dictionaryFromCodeCoverageTarget:target]];
    }
    
    NSDictionary *dictionary = @{@"targets":targets};
    
    return dictionary;
}

#pragma mark - Private class methods

+ (NSDictionary*)_dictionaryFromCodeCoverageTarget:(IDESchemeActionCodeCoverageTarget *)target {
    NSMutableArray *files = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFile *file in target.sourceFiles) {
        [files addObject:[NSDictionary _dictionaryFromCodeCoverageFile:file]];
    }
    
    return @{@"name":target.name,
             @"coverage":target.lineCoverage,
             @"files":files};
}

+ (NSDictionary*)_dictionaryFromCodeCoverageFile:(IDESchemeActionCodeCoverageFile *)file {
    NSMutableArray *functions = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFunction *function in file.functions) {
        NSDictionary *dictionary =  @{@"coverage":function.lineCoverage, @"name":function.name};
        [functions addObject:dictionary];
    }
    
    return @{@"name":file.name,
             @"coverage":file.lineCoverage,
             @"functions":functions};
}

@end
