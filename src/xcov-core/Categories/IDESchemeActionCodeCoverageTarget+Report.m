//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageTarget+Report.h"
#import "IDESchemeActionCodeCoverageFile+Report.h"

@implementation IDESchemeActionCodeCoverageTarget (Report)
- (NSDictionary *)convertToDictionaryIncludingLines:(BOOL)includeLines {
    NSMutableArray *files = [NSMutableArray array];
    
    for (IDESchemeActionCodeCoverageFile *file in self.sourceFiles) {
        NSDictionary *fileDictionary = [self dictionaryFromCodeCoverageFile:file
                                                               includeLines:includeLines];
        [files addObject:fileDictionary];
    }
    
    return @{@"name": self.name,
             @"coverage": self.lineCoverage,
             @"files": files};
}

#pragma mark - Private methods

- (NSDictionary *)dictionaryFromCodeCoverageFile:(IDESchemeActionCodeCoverageFile *)file
                                    includeLines:(BOOL)includeLines {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    dictionary[@"name"] = file.name;
    dictionary[@"coverage"] = file.lineCoverage;
    dictionary[@"functions"] = [file convertFunctionsToDictionaries];
    dictionary[@"location"] = file.documentLocation;
    
    if (includeLines) {
        dictionary[@"lines"] = [file convertLinesToDictionaries];
    }
    
    return dictionary;
}

@end
