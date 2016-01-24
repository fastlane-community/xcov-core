//
//  Created by Carlos Vidal Pallin on 24/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"

#import <IDEFoundation/IDESchemeActionCodeCoverage.h>
#import <IDEFoundation/IDESchemeActionCodeCoverageFile.h>
#import <DVTFoundation/DVTSourceFileLineCoverageData.h>
#import <IDEFoundation/IDESchemeActionCodeCoverageTarget.h>
#import <IDEFoundation/IDESchemeActionCodeCoverageFunction.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    id coverage = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/nakio/Desktop/sample.xccoverage"];
    NSLog(@"%@", coverage);
    exit(0);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {

}

@end
