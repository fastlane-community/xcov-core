//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverage.h"

#import "DDCliUtil.h"
#import "NSDictionary+Report.h"
#import "Reader.h"

@interface Reader()

@property (nonatomic, assign, readonly) CoreOptions options;
@property (nonatomic, strong, readonly) NSFileManager *fileManager;

@end

@implementation Reader

- (instancetype)initWithOptions:(CoreOptions)options {
    self = [super init];
    
    if (self != nil) {
        self->_options = options;
        self->_fileManager = [NSFileManager defaultManager];
    }
    
    return self;
}

#pragma mark - Public methods

- (NSDictionary *)read {
    if ([self _isValidPath] == NO) {
        ddprintf(@"The source path provided is not correct\n");
        exit(66);
    }
    
    ddprintf(@"Opening .xccoverage file at path: %@\n", self.options.source);
    IDESchemeActionCodeCoverage *coverage = [NSKeyedUnarchiver unarchiveObjectWithFile:self.options.source];
    if (coverage == nil) {
        ddprintf(@"Unable to read .xccoverage file\n");
        exit(65);
    }
    
    ddprintf(@"Add file location? %@\n", self.options.addLocation ? @"yes" : @"no");
    ddprintf(@"Parsing .xccoverage file...\n");
    NSDictionary *report = [NSDictionary dictionaryFromCodeCoverage:coverage addingLocation:self.options.addLocation];
    if (report == nil) {
        ddprintf(@"Unable to parse .xccoverage file\n");
        exit(65);
    }
    ddprintf(@"File successfully parsed\n");
    return report;
}

#pragma mark - Private methods

- (BOOL)_isValidPath {
    BOOL isDirectory;
    if ([self.fileManager fileExistsAtPath:self.options.source isDirectory:&isDirectory]) {
        if (isDirectory) {
            return NO;
        }
        return YES;
    }
    return NO;
}

@end
