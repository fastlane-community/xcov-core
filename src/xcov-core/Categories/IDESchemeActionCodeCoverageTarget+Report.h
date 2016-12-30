//
//  Created by Andrei Raifura on 12/30/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "IDESchemeActionCodeCoverageTarget.h"

@interface IDESchemeActionCodeCoverageTarget (Report)
- (NSDictionary *)convertToDictionaryIncludingLines:(BOOL)includeLines;

@end
