//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDCommandLineInterface.h"
#import "Middleware.h"

int main(int argc, const char * argv[]) {
    return DDCliAppRunWithClass([Middleware class]);
}
