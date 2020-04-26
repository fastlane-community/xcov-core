//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageTarget+Report.h"
#import "IDESchemeActionCodeCoverageFile+Report.h"

@implementation NSObject (IDESchemeActionCodeCoverageTarget)

- (NSDictionary *)IDESchemeActionCodeCoverageTarget_convertToDictionary {
    NSMutableArray *files = [NSMutableArray array];
    
    for (NSObject *file in [self performSelector:@selector(sourceFiles)]) {
        NSDictionary *fileDictionary = [self dictionaryFromCodeCoverageFile:file];
        [files addObject:fileDictionary];
    }
    
    NSInteger const coveredLines = (NSUInteger)[self performSelector:@selector(coveredLines)];
    NSInteger const executableLines = (NSUInteger)[self performSelector:@selector(executableLines)];
    double const lineCoverage = executableLines == 0.f ? 0.f : (double)coveredLines / (double)executableLines;
    
    return @{@"name": [self performSelector:@selector(name)],
             @"coverage": @(lineCoverage),
             @"files": files};
}

#pragma mark - Private methods

- (NSDictionary *)dictionaryFromCodeCoverageFile:(NSObject *)file {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    dictionary[@"name"] = [file performSelector:@selector(name)];
    dictionary[@"coverage"] = [file performSelector:@selector(lineCoverage)];
    dictionary[@"coveredLines"] = @((NSUInteger)[file performSelector:@selector(coveredLines)]);
    dictionary[@"executableLines"] = @((NSUInteger)[file performSelector:@selector(executableLines)]);
    dictionary[@"functions"] = [file IDESchemeActionCodeCoverageFile_convertFunctionsToDictionaries];
    dictionary[@"location"] = [file performSelector:@selector(documentLocation)];

    return dictionary;
}

@end
