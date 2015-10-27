//
//  AlgorithmsForDictionaries.m
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/26/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import "AlgorithmsForDictionaries.h"

@interface AlgorithmsForDictionaries ()

@end

@implementation AlgorithmsForDictionaries

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSDictionary *dictionary = @{@"key1":@1, @"key2":@2, @"key3":@3, @"key4":@4};

    NSLog(@"The updated dictionary is %@", [self increaseValueForKey:@"key1" byAmount:@10 inDictionary:dictionary]);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Increase Value for Key

-(NSMutableDictionary *)increaseValueForKey:(NSString *)key byAmount:(NSNumber *)num inDictionary:(NSDictionary *)dictionary{


    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict = dictionary.mutableCopy;



    NSNumber *object = [dict objectForKey:key];

    NSNumber *value = object;
    NSNumber *result = nil;

    result = @([value integerValue] + [num integerValue]);

    [dict setObject:result forKey:key];



    return dict.mutableCopy;

}

@end
