//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVTSourceFileLineCoverageData : NSObject <NSCoding>
@property(nonatomic, copy) NSArray *subRanges;
@property(nonatomic, assign, getter=isExecutable) BOOL executable;
@property(nonatomic, assign) int executionCount;

@end

