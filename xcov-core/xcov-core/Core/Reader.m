//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverage.h"

#import "NSDictionary+Report.h"
#import "Reader.h"

@interface Reader()

@property (nonatomic, copy, readonly) NSString *path;
@property (nonatomic, strong, readonly) NSFileManager *fileManager;

@end

@implementation Reader

- (instancetype)initWithPath:(NSString*)path {
    self = [super init];
    
    if (self != nil) {
        self->_path = path;
        self->_fileManager = [NSFileManager defaultManager];
    }
    
    return self;
}

#pragma mark - Public methods

- (NSDictionary *)read {
    if ([self _isValidPath] == NO) {
        exit(1);
    }
    
    IDESchemeActionCodeCoverage *coverage = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    if (coverage == nil) {
        exit(1);
    }
        
    NSDictionary *report = [NSDictionary dictionaryFromCodeCoverage:coverage];
    return report;
}

#pragma mark - Private methods

- (BOOL)_isValidPath {
    BOOL isDirectory;
    if ([self.fileManager fileExistsAtPath:self.path isDirectory:&isDirectory]) {
        if (isDirectory) {
            return NO;
        }
        return YES;
    }
    return NO;
}

@end
