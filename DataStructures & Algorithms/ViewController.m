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




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Arrays 

//Find max element in an array.

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

@end
