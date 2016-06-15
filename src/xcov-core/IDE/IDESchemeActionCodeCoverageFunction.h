//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVTCoverageDataContainer.h"
#import "DVTSourceCodeSymbolKind.h"
#import "IDESchemeActionCodeCoverageFile.h"

@interface IDESchemeActionCodeCoverageFunction : DVTCoverageDataContainer

@property (nonatomic, copy) NSString *symbolKind;
@property (nonatomic, assign) int lineNumber;
@property (nonatomic, assign) int executionCount;

@end
