//
//  LinkedList.h
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/27/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//
@class Node;
#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject
@property Node *head;
@property Node *tail;
@property Node *current;

-(instancetype)initWithHead:(NSObject *)value;


- (void)addToFront:(NSObject *)value;
- (void)addToBack:(NSObject *)value;

-(NSObject *)first;
-(NSObject *)currentValue;
-(NSObject *)next;
-(NSObject *)previous;

- (NSUInteger)count;
-(NSObject *)objectAtIndex:(NSUInteger)index;
-(NSArray *)findObject:(NSObject *)object;

-(BOOL)removeCurrent;
-(BOOL)removeObjectAtIndex:(NSUInteger)index;
-(void)reverseList;



@end
