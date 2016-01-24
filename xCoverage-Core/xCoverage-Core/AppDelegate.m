//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "Core.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) Core *core;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSArray *arguments = [NSProcessInfo processInfo].arguments;
    if (arguments.count <= 3) {
        exit(1);
    }
    
    NSString *sourcePath = arguments[1];
    NSString *targetPath = arguments[2];
    self.core = [[Core alloc] initWithSourcePath:sourcePath targetPath:targetPath];
    [self.core runWithCompletion:^(int code) {
        exit(code);
    }];
}

@end
