//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Writer : NSObject

- (instancetype)initWithPath:(NSString*)path;
- (void)writeReport:(NSDictionary*)report;

@end
