//
//  Created by Andrei Raifura on 11/12/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "DVTSourceFileHighlightingRange.h"

@implementation DVTSourceFileHighlightingRange

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self != nil) {
        _length = [aDecoder decodeDoubleForKey:@"length"];
        _column = [aDecoder decodeDoubleForKey:@"column"];
        _line = [aDecoder decodeDoubleForKey:@"line"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
