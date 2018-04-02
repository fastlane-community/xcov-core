//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageTarget+Report.h"
#import "IDESchemeActionCodeCoverageFile+Report.h"

@implementation NSObject (IDESchemeActionCodeCoverageTarget)

- (NSDictionary *)IDESchemeActionCodeCoverageTarget_convertToDictionaryIncludingLines:(BOOL)includeLines {
    NSMutableArray *files = [NSMutableArray array];
    
    for (NSObject *file in [self performSelector:@selector(sourceFiles)]) {
        NSDictionary *fileDictionary = [self dictionaryFromCodeCoverageFile:file includeLines:includeLines];
        [files addObject:fileDictionary];
    }
    
    return @{@"name": [self performSelector:@selector(name)],
             @"coverage": [self performSelector:@selector(lineCoverage)],
             @"files": files};
}

#pragma mark - Private methods

- (NSDictionary *)dictionaryFromCodeCoverageFile:(NSObject *)file
                                    includeLines:(BOOL)includeLines {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    dictionary[@"name"] = [file performSelector:@selector(name)];
    dictionary[@"coverage"] = [file performSelector:@selector(lineCoverage)];
    dictionary[@"functions"] = [file IDESchemeActionCodeCoverageFile_convertFunctionsToDictionaries];
    dictionary[@"location"] = [file performSelector:@selector(documentLocation)];
    
    if (includeLines) {
        dictionary[@"lines"] = [file IDESchemeActionCodeCoverageFile_convertLinesToDictionaries];
    }
    
    return dictionary;
}

@end
