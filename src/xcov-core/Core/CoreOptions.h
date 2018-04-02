//
//  Created by Carlos Vidal Pallin on 08/07/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import<Foundation/Foundation.h>

typedef struct {
    __unsafe_unretained NSString *source;
    __unsafe_unretained NSString *target;
    __unsafe_unretained NSString *ideFoundationPath;
    BOOL includeLinesInfo;
} CoreOptions;
