//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "DVTCoverageDataContainer.h"

@implementation DVTCoverageDataContainer

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self != nil) {
        self.lineCoverage = [aDecoder decodeObjectForKey:@"lineCoverage"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.uniqueIdentifier = [aDecoder decodeObjectForKey:@"uniqueIdentifier"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
