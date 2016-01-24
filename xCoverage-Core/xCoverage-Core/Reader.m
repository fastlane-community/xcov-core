//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <IDEFoundation/IDESchemeActionCodeCoverage.h>

#import "NSDictionary+Report.h"
#import "Reader.h"

@interface Reader()

@property (nonatomic, copy, readonly) NSString *path;
@property (nonatomic, strong, readonly) NSFileManager *fileManager;
@property (nonatomic, strong, readonly) dispatch_queue_t queue;

@end

@implementation Reader

- (instancetype)initWithPath:(NSString*)path {
    self = [super init];
    
    if (self != nil) {
        self->_path = path;
        self->_fileManager = [NSFileManager defaultManager];
        self->_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    
    return self;
}

#pragma mark - Public methods

- (void)readWithSuccess:(void(^)(NSDictionary*))success failure:(void(^)())failure {
    if ([self _isValidPath] == NO) {
        failure();
        return;
    }
    
    dispatch_async(self.queue, ^{
        IDESchemeActionCodeCoverage *coverage = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
        if (coverage == nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure();
            });
            return;
        }
        
        NSDictionary *report = [NSDictionary dictionaryFromCodeCoverage:coverage];
        dispatch_async(dispatch_get_main_queue(), ^{
            success(report);
        });
    });
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
