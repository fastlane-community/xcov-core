//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreOptions.h"

@interface Writer : NSObject

- (instancetype)initWithOptions:(CoreOptions *)options;
- (void)writeReport:(NSDictionary*)report;

@end
