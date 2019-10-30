//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "Writer.h"

#import "DDCliUtil.h"

@interface Writer()

@property (nonatomic, strong, readonly) CoreOptions *options;
@property (nonatomic, strong, readonly) NSFileManager *fileManager;

@end

@implementation Writer

- (instancetype)initWithOptions:(CoreOptions *)options {
    self = [super init];
    
    if (self != nil) {
        self->_options = options;
        self->_fileManager = [NSFileManager defaultManager];
    }
    
    return self;
}

#pragma mark - Public methods

- (void)writeReport:(NSDictionary*)report {
    if ([self _isValidPath] == NO) {
        ddprintf(@"The output path provided is not correct\n");
        exit(73);
    }
    
    ddprintf(@"Serializing coverage report...\n");
    if ([NSJSONSerialization isValidJSONObject:report]) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:report options:0 error:&error];
        if (error == nil && data != nil) {
            ddprintf(@"Report successfully serialized\n");
            ddprintf(@"Writing report on disk...\n");
            [data writeToFile:self.options.target atomically:YES];
            ddprintf(@"Coverage report successfully created at path: %@\n", self.options.target);
            return;
        }
    }
    
    exit(73);
}

#pragma mark - Private methods

- (BOOL)_isValidPath {
    NSString *directory = [self.options.target stringByDeletingLastPathComponent];
    
    BOOL isDirectory;
    if ([self.fileManager fileExistsAtPath:directory isDirectory:&isDirectory]) {
        if (isDirectory) {
            return YES;
        }
    }
    return NO;
}

@end
