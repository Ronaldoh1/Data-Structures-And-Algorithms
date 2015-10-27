//
//  AlgorithmsForNSNumbers.m
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/26/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import "AlgorithmsForNSNumbers.h"

@interface AlgorithmsForNSNumbers ()

@end

@implementation AlgorithmsForNSNumbers

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSLog(@"The greatest common divisor is %ld", (long)[self findGreatestCommonDivisorOfNumber:@8 andNumber:@4]);

    //Test the factorial

   NSLog(@"The factorial of 5 is %lu", (unsigned long)[self findTheFactorialOfNumber:@5]);

    NSLog(@"The fibonnaci sum until 20 is %@ " , [self fibonacciNumbersUpToNumber:20]);

    NSLog(@"The recursive solution for fibonacci is %lld", [self recursiveFibonacciNumber:20]);

    NSLog(@"The sum of the digits of 12 is %lu", [self sumOfDigitsOfNumber:@12]);
    NSLog(@"Number with exponents %ld", [self fastExponentialForNumber:10 withPower:3]);

    BOOL t = [self checkForEvenForNumber:24];
    NSLog(@"the number 24 is EVEN %@", t ? @"YES" : @"NO");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark - Greatest Common Divisor

-(NSInteger)findGreatestCommonDivisorOfNumber:(NSNumber *)num1 andNumber:(NSNumber *)num2{

    NSInteger first = [num1 integerValue];
    NSInteger second = [num2 integerValue];

    NSInteger c = 0;

    while (second != 0) {

        c = second;
        second = first % second;
        first = c ;
    }


    return first;
}

#pragma mark - LCM (Least Common Multiplier) 

-(NSUInteger)leastCommonMultiplierWithNumber:(NSNumber *)num1 andWithNumber:(NSNumber *)num2{

    return ([num1 integerValue] * [num2 integerValue]) / [self findGreatestCommonDivisorOfNumber:num1 andNumber:num2];
}
-(NSUInteger )findTheFactorialOfNumber:(NSNumber *)number{

    NSUInteger factorial = [number integerValue];

    for (int i = 1; i<[number integerValue]; i++) {
        factorial = factorial * i;
    }

    return factorial;
}

-(NSMutableArray *)fibonacciNumbersUpToNumber:(NSUInteger)number{

    NSMutableArray *resultsArray = [@[]mutableCopy];
    resultsArray[0] = @0;
    resultsArray[1] = @1;

    //iterate until the number

    for (int i =  2; i<number; i++) {

        NSNumber *foo = @([resultsArray[i -2] integerValue] + [resultsArray[i - 1] integerValue]);
        resultsArray[i] = foo;
    }

    return resultsArray;

}

-(long long int)recursiveFibonacciNumber:(NSUInteger)index{

    if (index == 0) {
        return (long long)0;
    } else if(index == 1){
        return (long long)1;
    } else{

        return [self recursiveFibonacciNumber:index-2] + [self recursiveFibonacciNumber:index - 1];
    }
}


#pragma mark - sum of digits of a number

-(NSUInteger)sumOfDigitsOfNumber:(NSNumber *)number{

    NSUInteger digit = [number unsignedIntegerValue];

    NSUInteger sum = 0;

    while (digit != 0) {
        sum = sum + digit % 10;
        digit = digit / 10;

    }
    return  sum;
}

#pragma mark - Fast Exponential 

-(NSInteger)fastExponentialForNumber:(NSInteger)number withPower:(NSInteger)power{

    NSInteger result = 1;

    while (power) {
        if (power % 2 == 1) {
            result *=number;
        }
        power /= 2;
        number *= number;
    }
    return  result;
}

#pragma Mark  - is Even/Odd 

-(BOOL)checkForEvenForNumber:(NSInteger)number{

    return (number % 2 == 0) ? YES : NO;
}

@end
