//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DVTCoverageDataContainer.h"

@interface IDESchemeActionCodeCoverageTarget : DVTCoverageDataContainer

@property (nonatomic, copy) NSString *productPath;
@property (nonatomic, copy) NSString *buildableIdentifier;
@property (nonatomic, copy) NSArray *sourceFiles;

@end
