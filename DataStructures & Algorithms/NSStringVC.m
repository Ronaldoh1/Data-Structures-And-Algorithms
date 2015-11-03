//
//  NSStringVC.m
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/27/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import "NSStringVC.h"

@interface NSStringVC ()

@end

@implementation NSStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSLog(@"is the MADADM a palindrome? %@", [self checkIfStringIsPalindrome:@"madam"] ? @"YES" : @"NO");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - is string palindrom
-(BOOL)checkIfStringIsPalindrome:(NSString *)string{

    BOOL result = NO;

    NSString *nonWhiteSpacedBufferString = [[string stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];

    NSString *reverseString = [self reverseString:string];

    result = [reverseString isEqualToString:string] ? YES : NO;

    return result;


}
#pragma mark - reverse string 

-(NSString *)reverseString:(NSString *)string{

    NSMutableString *result = [NSMutableString new];


    for (NSInteger i = (NSInteger)[string length] - 1; i>=0; i--) {

        [result appendString:[NSString stringWithFormat:@"%C", [string characterAtIndex:(NSInteger)i]]];
    }

    return [result copy];
}


@end
