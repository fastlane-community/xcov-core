//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageTarget.h"

@implementation IDESchemeActionCodeCoverageTarget

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        self.sourceFiles = [aDecoder decodeObjectForKey:@"sourceFiles"];
        self.buildableIdentifier = [aDecoder decodeObjectForKey:@"buildableIdentifier"];
        self.productPath = [aDecoder decodeObjectForKey:@"productPath"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
