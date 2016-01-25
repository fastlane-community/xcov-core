//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVTCoverageDataContainer.h"

@interface IDESchemeActionCodeCoverageFile : DVTCoverageDataContainer

@property (nonatomic, copy) NSArray *lines;
@property (nonatomic, copy) NSArray *functions;
@property (nonatomic, copy) NSString *documentLocation;

@end
