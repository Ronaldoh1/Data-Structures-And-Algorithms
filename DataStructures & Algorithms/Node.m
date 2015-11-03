//
//  Node.m
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/27/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import "Node.h"


@implementation Node

-(instancetype)initWithObject:(NSObject *)object{
    if (self = [super init]) {

        _value = object;
    }
    return  self;
}

@end
