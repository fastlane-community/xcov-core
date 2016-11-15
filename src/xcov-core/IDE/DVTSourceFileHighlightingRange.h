//
//  Created by Andrei Raifura on 11/12/16.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVTSourceFileHighlightingRange : NSObject <NSCoding>
@property(nonatomic) unsigned long long length;
@property(nonatomic) unsigned long long column;
@property(nonatomic) unsigned long long line;

@end
