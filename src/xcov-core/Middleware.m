//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import "Middleware.h"
#import "DDCliApplication.h"
#import "Core.h"

NSString *const MiddlewareAppVersion    = @"0.5";
NSString *const MiddlewareAppName       = @"xcov-core";

@implementation Middleware

#pragma mark - DDCliApplicationDelegate methods

- (int)application:(DDCliApplication *)app runWithArguments:(NSArray *)arguments {
    
    ddprintf(@"------ %@ ------\n", MiddlewareAppName);
    
    if (_help) {
        [self _printHelp];
        return EXIT_SUCCESS;
    }
    
    if (_version) {
        [self _printVersion];
        return EXIT_SUCCESS;
    }
    
    if (_source == nil || _output == nil || _ideFoundationPath == nil) {
        ddfprintf(stderr, @"--source, --output and --ide-foundation-path parameters are required\n");
        return EX_USAGE;
    }
    
    [self _runCore];
    return EXIT_SUCCESS;
}

- (void)application:(DDCliApplication *)app willParseOptions:(DDGetoptLongParser *)optionsParser {
    DDGetoptOption optionTable[] = {
        {@"source",             's',    DDGetoptRequiredArgument},
        {@"output",             'o',    DDGetoptRequiredArgument},
        {@"ide-foundation-path",'x',    DDGetoptRequiredArgument},
        {@"include-lines-info",   0,    DDGetoptNoArgument},
        {@"help",               'h',    DDGetoptNoArgument},
        {@"version",            'v',    DDGetoptNoArgument},
        {nil,                     0,    0},
    };
    
    [optionsParser addOptionsFromTable:optionTable];
}

#pragma mark - Private methods

- (void)_runCore {
    CoreOptions options;
    options.source = [self convertToAbsolutePath:_source];
    options.target = [self convertToAbsolutePath:_output];
    options.ideFoundationPath = [self convertToAbsolutePath:_ideFoundationPath];
    options.includeLinesInfo = _includeLinesInfo;
    Core *core = [[Core alloc] initWithOptions:options];
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
             @"      --include-lines-info      Include full info about lines and ranges\n"
             @"  -v  --version                 Display version\n"
             @"  -h, --help                    Display this help\n"
             @"\n"
             @"%@ v.%@ - Created by Carlos Vidal (@carlostify)\n", MiddlewareAppName, MiddlewareAppVersion);
}

- (void)_printVersion {
    ddprintf(@"%@ v.%@ - Created by Carlos Vidal (@carlostify)\n", MiddlewareAppName, MiddlewareAppVersion);
}

- (NSString *)convertToAbsolutePath:(NSString *)path {
    if([path hasPrefix:@"/"]) { // it's already an absolute path
        return path;
    }

    if([path hasPrefix:@"~"]) { // is relative to user folder
        return [path stringByExpandingTildeInPath];
    }

    return [[[NSURL alloc] initFileURLWithPath:path] path];
}

@end
