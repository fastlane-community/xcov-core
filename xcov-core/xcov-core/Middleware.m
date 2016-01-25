//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "Middleware.h"
#import "DDCliApplication.h"
#import "Core.h"

NSString *const MiddlewareAppVersion = @"0.1";

@implementation Middleware

#pragma mark - DDCliApplicationDelegate methods

- (int)application:(DDCliApplication *)app runWithArguments: (NSArray *)arguments {
    
    if (_help) {
        [self _printHelp];
        return EXIT_SUCCESS;
    }
    
    if (_version) {
        [self _printVersion];
        return EXIT_SUCCESS;
    }
    
    if (_source == nil || _output == nil) {
        ddfprintf(stderr, @"Source and target paths are required\n");
        return EX_USAGE;
    }
    
    [self _runCore];
    return EXIT_SUCCESS;
}

- (void)application:(DDCliApplication *)app willParseOptions:(DDGetoptLongParser *)optionsParser {
    DDGetoptOption optionTable[] = {
        {@"source",    's',    DDGetoptRequiredArgument},
        {@"output",    'o',    DDGetoptRequiredArgument},
        {@"help",      'h',    DDGetoptNoArgument},
        {@"version",   'v',    DDGetoptNoArgument},
        {nil,            0,    0},
    };
    
    [optionsParser addOptionsFromTable: optionTable];
}

#pragma mark - Private methods

- (void)_runCore {
    Core *core = [[Core alloc] initWithSourcePath:_source targetPath:_output];
    [core run];
}

- (void)_printUsage:(FILE *)stream {
    ddfprintf(stream, @"Usage [OPTIONS] <argument> [...]\n");
}

- (void)_printHelp {
    [self _printUsage: stdout];
    ddprintf(@"\n"
             @"  -s, --source FILE             Full path to the .xccoverage file\n"
             @"  -o, --output FILE             Full path to the resulting .json file\n"
             @"  -v  --version                 Display version\n"
             @"  -h, --help                    Display this help\n"
             @"\n"
             @"%@ v.%@ - Created by Carlos Vidal (@carlostify)\n", DDCliApp, MiddlewareAppVersion);
}

- (void)_printVersion {
    ddprintf(@"%@ v.%@ - Created by Carlos Vidal (@carlostify)\n", DDCliApp, MiddlewareAppVersion);
}

@end
