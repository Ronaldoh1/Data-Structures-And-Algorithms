//
//  Node.h
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/27/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property NSObject *value;
@property Node *previous;
@property Node *next;

-(instancetype)initWithObject:(NSObject *)object;


@end
