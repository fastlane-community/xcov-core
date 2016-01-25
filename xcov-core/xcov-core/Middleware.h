//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDCommandLineInterface.h"

@interface Middleware : NSObject <DDCliApplicationDelegate> {
    NSString * _source;
    NSString * _output;
    BOOL _version;
    BOOL _help;
}

@end
