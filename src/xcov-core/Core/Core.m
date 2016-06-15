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

- (void)run {
    NSDictionary *report = [self.reader read];
    [self.writer writeReport:report];
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
