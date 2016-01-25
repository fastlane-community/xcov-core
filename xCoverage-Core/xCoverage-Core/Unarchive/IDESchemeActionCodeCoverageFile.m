//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageFile.h"

@implementation IDESchemeActionCodeCoverageFile

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        self.documentLocation = [aDecoder decodeObjectForKey:@"documentLocation"];
        self.lines = [aDecoder decodeObjectForKey:@"lines"];
        self.functions = [aDecoder decodeObjectForKey:@"functions"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
