//
//  Created by Carlos Vidal Pallin on 25/01/2016.
//  Copyright © 2016 nakioStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVTSourceCodeSymbolKind : NSObject

@property (nonatomic, copy) NSString *localizedDescription;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSArray *allConformingSymbolKinds;
@property (nonatomic, copy) NSArray *conformedToSymbolKinds;
@property (nonatomic, assign, getter=isContainer) BOOL container;
@property (nonatomic, assign) BOOL navigationPrefersDefinition;

@end

