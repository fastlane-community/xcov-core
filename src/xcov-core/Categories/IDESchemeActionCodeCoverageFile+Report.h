//
//  Created by Andrei Raifura on 11/12/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageFile.h"

@interface IDESchemeActionCodeCoverageFile (Report)
- (NSArray *)convertFunctionsToDictionaries;
- (NSArray *)convertLinesToDictionaries;

@end
