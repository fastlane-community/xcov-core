//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "Writer.h"

@interface Writer()

@property (nonatomic, copy, readonly) NSString *path;
@property (nonatomic, strong, readonly) NSFileManager *fileManager;

@end

@implementation Writer

- (instancetype)initWithPath:(NSString*)path {
    self = [super init];
    
    if (self != nil) {
        self->_path = path;
        self->_fileManager = [NSFileManager defaultManager];
    }
    
    return self;
}

#pragma mark - Public methods

- (void)writeReport:(NSDictionary*)report {
    if ([self _isValidPath] == NO) {
        exit(1);
    }
    
    if ([NSJSONSerialization isValidJSONObject:report]) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:report options:0 error:&error];
        if (error == nil && data != nil) {
            [data writeToFile:self.path atomically:YES];
            NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            return;
        }
    }
    
    exit(1);
}

#pragma mark - Private methods

- (BOOL)_isValidPath {
    NSString *directory = [self.path stringByDeletingLastPathComponent];
    
    BOOL isDirectory;
    if ([self.fileManager fileExistsAtPath:directory isDirectory:&isDirectory]) {
        if (isDirectory) {
            return YES;
        }
    }
    return NO;
}

@end
