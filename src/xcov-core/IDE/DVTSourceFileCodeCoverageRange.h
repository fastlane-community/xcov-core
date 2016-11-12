//
//  Created by Andrei Raifura on 9/2/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVTSourceFileCodeCoverageRange : NSObject <NSCoding>

@property(readonly, nonatomic) BOOL executable;
@property(readonly, nonatomic) unsigned long long length;
@property(readonly, nonatomic) unsigned long long column;
@property(readonly, nonatomic) unsigned long long line;

@property(readonly, nonatomic) int executionCount;

@end
