//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVTCoverageDataContainer : NSObject <NSCoding>

@property (nonatomic, strong) NSNumber *lineCoverage;
@property (nonatomic, copy) NSString *uniqueIdentifier;
@property (nonatomic, copy) NSString *name;

@end
