//
//  Created by Andrei Raifura on 9/2/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "DVTSourceFileCodeCoverageRange.h"

@implementation DVTSourceFileCodeCoverageRange

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self != nil) {
        _executionCount = [aDecoder decodeIntForKey:@"x"];
        _length = [aDecoder decodeInt64ForKey:@"len"];
        _column = [aDecoder decodeInt64ForKey:@"c"];
        _line = [aDecoder decodeInt64ForKey:@"l"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
