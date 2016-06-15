//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reader : NSObject

- (instancetype)initWithPath:(NSString*)path;
- (NSDictionary *)read;

@end
