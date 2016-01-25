//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverage.h"

@interface IDESchemeActionCodeCoverage()

@end

@implementation IDESchemeActionCodeCoverage

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self != nil) {
        self.codeCoverageTargets = [aDecoder decodeObjectForKey:@"buildableCoverageObjects"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

}

@end
