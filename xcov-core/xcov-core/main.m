//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Core.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *sourcePath = @"/Users/nakio/Desktop/sample.xccoverage";
        NSString *targetPath = @"/Users/nakio/Desktop/result.json";
        Core *core = [[Core alloc] initWithSourcePath:sourcePath targetPath:targetPath];
        [core run];
    }
    return 0;
}
