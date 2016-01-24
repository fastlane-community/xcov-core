//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Core : NSObject

- (instancetype)initWithSourcePath:(NSString*)sourcePath targetPath:(NSString*)targetPath;
- (void)runWithCompletion:(void(^)(int))completion;

@end
