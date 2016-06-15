//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageFunction.h"

@implementation IDESchemeActionCodeCoverageFunction

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        self.lineNumber = [aDecoder decodeInt32ForKey:@"lineNumber"];
        self.executionCount = [aDecoder decodeInt32ForKey:@"executionCount"];
        self.symbolKind = [aDecoder decodeObjectForKey:@"symbolKindIdentifier"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
