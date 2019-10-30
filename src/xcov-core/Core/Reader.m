//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#include  <dlfcn.h>
#import "IDESchemeActionCodeCoverage+Report.h"
#import "DDCliUtil.h"
#import "Reader.h"

@interface Reader()

@property (nonatomic, strong, readonly) CoreOptions *options;
@property (nonatomic, strong, readonly) NSFileManager *fileManager;

@end

@implementation Reader

- (instancetype)initWithOptions:(CoreOptions *)options {
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
    
    if (dlopen(self.options.ideFoundationPath.UTF8String, RTLD_LAZY) == NULL) {
        ddprintf(@"IDEFoundation could not be loaded\n");
        exit(66);
    }
    
    ddprintf(@"Opening .xccoverage file at path: %@\n", self.options.source);
    NSObject *coverage = [NSKeyedUnarchiver unarchiveObjectWithFile:self.options.source];
    if (coverage == nil) {
        ddprintf(@"Unable to read .xccoverage file\n");
        exit(65);
    }
    
    ddprintf(@"Parsing .xccoverage file...\n");
    NSDictionary *report = [coverage IDESchemeActionCodeCoverage_convertToDictionary];
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
        return !isDirectory;
    }
    return NO;
}

@end
