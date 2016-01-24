//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "Core.h"
#import "Reader.h"
#import "Writer.h"

@interface Core()

@property (nonatomic, copy, readonly) NSString *sourcePath;
@property (nonatomic, copy, readonly) NSString *targetPath;

@property (nonatomic, strong, readonly) Reader *reader;
@property (nonatomic, strong, readonly) Writer *writer;

@end

@implementation Core

@synthesize reader = _reader;
@synthesize writer = _writer;

- (instancetype)initWithSourcePath:(NSString*)sourcePath targetPath:(NSString*)targetPath {
    self = [super init];
    
    if (self != nil) {
        self->_sourcePath = sourcePath;
        self->_targetPath = targetPath;
    }
    
    return self;
}

#pragma mark - Public methods

- (void)runWithCompletion:(void(^)(int))completion {
    [self _readWithCompletion:completion];
}

#pragma mark - Private methods

- (void)_readWithCompletion:(void(^)(int))completion {
    __weak typeof(self) weakSelf = self;
    id readSuccess = ^(NSDictionary *report) {
        typeof(self) refSelf = weakSelf;
        [refSelf _writeReport:report completion:completion];
    };
    
    id readFailure = ^{
        completion(1);
    };
    
    [self.reader readWithSuccess:readSuccess failure:readFailure];
}

- (void)_writeReport:(NSDictionary*)report completion:(void(^)(int))completion {
    id writeSuccess = ^() {
        completion(0);
    };
    
    id writeFailure = ^{
        completion(1);
    };
    
    [self.writer writeReport:report success:writeSuccess failure:writeFailure];
}

#pragma mark - Lazy loading

- (Reader *)reader {
    if (self->_reader == nil) {
        self->_reader = [[Reader alloc] initWithPath:self.sourcePath];
    }
    
    return self->_reader;
}

- (Writer *)writer {
    if (self->_writer == nil) {
        self->_writer = [[Writer alloc] initWithPath:self.targetPath];
    }
    
    return self->_writer;
}

@end
