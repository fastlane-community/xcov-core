//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "NSDictionary+Report.h"

#import <IDEFoundation/IDESchemeActionCodeCoverage.h>
#import <IDEFoundation/IDESchemeActionCodeCoverageFile.h>
#import <DVTFoundation/DVTSourceFileLineCoverageData.h>
#import <IDEFoundation/IDESchemeActionCodeCoverageTarget.h>
#import <IDEFoundation/IDESchemeActionCodeCoverageFunction.h>

@implementation NSDictionary (Report)

+ (NSDictionary*)dictionaryFromCodeCoverage:(IDESchemeActionCodeCoverage *)codeCoverage {
    NSMutableArray *targets = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageTarget *target in codeCoverage.codeCoverageTargets) {
        [targets addObject:[NSDictionary _dictionaryFromCodeCoverageTarget:target]];
    }
    
    NSDictionary *dictionary = @{@"coverage":codeCoverage.lineCoverage,
                                 @"targets":targets};
    
    return dictionary;
}

#pragma mark - Private class methods

+ (NSDictionary*)_dictionaryFromCodeCoverageTarget:(IDESchemeActionCodeCoverageTarget *)target {
    id name = target.productPath.lastPathComponent ?: [NSNull null];
    NSMutableArray *files = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFile *file in target.sourceFiles) {
        [files addObject:[NSDictionary _dictionaryFromCodeCoverageFile:file]];
    }
    
    return @{@"name":name,
             @"coverage":target.lineCoverage,
             @"files":files};
}

+ (NSDictionary*)_dictionaryFromCodeCoverageFile:(IDESchemeActionCodeCoverageFile *)file {
    id name = file.documentLocation.lastPathComponent ?: [NSNull null];
    NSMutableArray *functions = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFunction *function in file.functions) {
        [functions addObject:[NSDictionary _dictionaryFromCodeCoverageFunction:function]];
    }
    
    return @{@"name":name,
             @"coverage":file.lineCoverage,
             @"functions":functions};
}

+ (NSDictionary*)_dictionaryFromCodeCoverageFunction:(IDESchemeActionCodeCoverageFunction *)function {
    NSMutableDictionary *dictionary = @{@"coverage":function.lineCoverage}.mutableCopy;
    NSArray *components = [function.description componentsSeparatedByString:@","];
    if (components.count > 0) {
        dictionary[@"name"] = components[0];
    }
    
    return dictionary;
}

@end
