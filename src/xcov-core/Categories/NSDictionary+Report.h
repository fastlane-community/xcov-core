//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDESchemeActionCodeCoverage;

@interface NSDictionary (Report)

+ (NSDictionary*)dictionaryFromCodeCoverage:(IDESchemeActionCodeCoverage *)codeCoverage addingLocation:(BOOL)addLocation;

@end
