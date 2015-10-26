//
//  ViewController.m
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/25/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //1. Find the index of Max Value
    NSArray *testArray = [NSArray arrayWithObjects:@4, @3, @8, @10, @1, nil];

   NSUInteger indexOfMaximumElement =  [self findIndexOfMaximumElement:testArray];
    NSLog(@"The indexOfMaximum Element is %lu", (unsigned long)indexOfMaximumElement);


   //2. Test Longest String

    NSArray *stringArray = [NSArray arrayWithObjects:@"Ronald",@"Two", @"Philz", nil];

   NSString *longString =  [self findLogestStringinArray:stringArray];

    NSLog(@"%@", longString);


 //3 test the shorstest string

    NSString *shortestString = [self findShortestStringinArray:stringArray];
    NSLog(@"%@ is the shortest string", shortestString);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Arrays 

#pragma mark - Find max element in an array.

//**Stragegy - the stragety is to assign the maxValue to the first object of the arrray and set the indexOfMaxValue to zero and update these as you iterate through the array and compare if the ith element of the array is greater than the maximum value ..if it is then that is your new maxValue.
-(NSUInteger )findIndexOfMaximumElement:(NSArray *)array{
    id maximumValue = [array firstObject];

    NSUInteger indexOfMaximumValue = 0;

    for (int i = 0; i<array.count; i++) {

        if ([array[i] compare:maximumValue] == NSOrderedDescending) {

            maximumValue = array[i];
            indexOfMaximumValue = i;
        }
    }

    return indexOfMaximumValue;


}

#pragma Mark - Find the Min and Max Elements of an array 
//
//-(NSArray *)findMinAndMaxofArray:(NSArray *)array{
//
//    //check if array is empty
//    if (array.count == 0) {
//        return nil;
//    }
//
//    NSNumber *minValue = @(NSIntegerMax);
//    NSNumber *maxValue = @(NSIntegerMin);
//
//    NSUInteger minValueIndex = 0;
//    NSUInteger maxValueIndex = 0;
//
//
//
//
//
//
//}

#pragma mark - find shortest string

//strategy is to keep track of the sortest string and compare it to the rest of the array.
-(NSString *)findShortestStringinArray:(NSArray *)array{

    NSString *shortestString = nil;

    for (NSString *string in array) {
        if (shortestString == nil || (string.length < shortestString.length)) {
            shortestString = string;
        }
    }

    return shortestString;

}

#pragma mark - find longest String

-(NSString *)findLogestStringinArray:(NSArray *)array{

    NSString *longestString = nil;

    for (NSString *string in array) {

        if (longestString == nil || (string.length > longestString.length)) {
            longestString = string;
        }
    }


    return longestString;
}



#pragma mark - Intersection of two arrays
//strategy is to use the










- (NSArray *)intersectionWithArray:(NSArray *)secondArray
{
    NSMutableSet *intersection = [NSMutableSet setWithArray:self];
    [intersection intersectSet:[NSSet setWithArray:secondArray]];

    return [intersection allObjects];
}

@end
