//
//  ViewController.m
//  DataStructures & Algorithms
//
//  Created by Ronald Hernandez on 10/25/15.
//  Copyright © 2015 Wahoo. All rights reserved.
//

#import "AlgorithmsForArrays.h"

@interface AlgorithmsForArrays ()

@end

@implementation AlgorithmsForArrays

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

    //4. Test intersection
    NSArray *array1 = [NSArray arrayWithObjects:@4, @3, @8, @10, @1, nil];
    NSArray *array2 = [NSArray arrayWithObjects:@4, @1, @8, @11, @1, @4, nil];

    NSLog(@"The intersection is %@", [self findInterSectionOfArray:array1 andSecondArray:array2]);

//4. Test the union of two arrays.
    NSLog(@"The union is %@", [self findTheUnionWithoutDuplictesOfArray:array1 andSecondArray:array2]);

    //5. Test for Duplicates

    NSLog(@"array 2 has the following duplicates %@", [self getDuplicatesFromArray:array2]);

    //6. Test for Sum

    NSLog(@"The sum of the elements in array are %@", [self computeSumOfElementsForArray:array2]);

    //7. Test the count of each object in the Set
    NSLog(@"The count of each number in the array is => %@", [self getOccurancesForEachElementInArray:array2]);

    NSLog(@"The count of each number in array is (Regular Search) %@", [self regularGetOccurancesForEachElementinArray:array2]);

    //8. Test Linear Search

    NSLog(@"The object you're looking for is at index... %lu", (unsigned long)[self findIndexOfObjectInArrayViaLinearSearchWithArray:array2 andObjectToFind:@11]);

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
//strategy is to use to use two sets initialized with arrays and use the built in intersection method of the two arrays.

-(NSArray *)findInterSectionOfArray:(NSArray *)firstArray andSecondArray:(NSArray *)secondArray{

    NSMutableSet *intersection = [NSMutableSet setWithArray:firstArray];

    [intersection intersectSet:[NSMutableSet setWithArray:secondArray]];


    return [intersection allObjects];

}

#pragma mark - find the Union of two arrays 

//to find the union of two arrays, we simply use two sets and call the union operation
-(NSArray *)findTheUnionWithoutDuplictesOfArray:(NSArray *)firstArray andSecondArray:(NSArray *)secondArray{

    NSMutableSet *set2 = [NSMutableSet setWithArray:secondArray];

    NSMutableSet *unionSet = [NSMutableSet setWithArray:firstArray];

    [unionSet unionSet:set2];

    return [unionSet allObjects];

}

#pragma Mark - Find Duplicates

-(BOOL)hasDuplicates:(NSMutableDictionary *)dictionary{

    for (id element in dictionary) {

        NSNumber *elementHash = @([element hash]);

        if (dictionary[elementHash] == nil) {
            dictionary[elementHash] = element;
        }else{
            NSLog(@"Dictionary has duplicates %@ and %@", dictionary[elementHash], element);
        }

    }



    return NO;
}

//Most effecient way to find duplicates in an array is to use NSCountedSet
-(NSArray *)getDuplicatesFromArray:(NSArray *)array{

    NSCountedSet *countedSet = [[NSCountedSet alloc]initWithArray:array];
    NSMutableArray *duplicates = [NSMutableArray new];

    NSLog(@"Object count greater than 1");

    for (NSNumber *num in countedSet){
        if ([countedSet countForObject:num] > 1) {

            NSLog(@"Array has duplicates");
            [duplicates addObject:num];

        }
    }

    return duplicates.copy;

}

#pragma mark - the sum of elments 

-(NSNumber *)computeSumOfElementsForArray:(NSArray *)array{

    long long sum = 0;

    for (NSNumber *num in array) {

        sum += [num longLongValue];
    }

    return @(sum);
}

#pragma mark - Find Occurances of each element in Array

//We want to use an NSCountedSet
/* 1. create an NSCountedSet with the array. 
 2. create a dictionary that will hold the object as key and value will bethe count. 
 3. We need an array to hold all the objects from the set. 
 4. We iterate through the array of all objects and for each object, we add it to the dictionary and set its value to the count of the object in the set
 
 */

-(NSDictionary *)getOccurancesForEachElementInArray:(NSArray *)array{

    NSCountedSet *countedSet = [[NSCountedSet alloc]initWithArray:array];

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    NSArray *setOfAllObjects = [countedSet allObjects];

    for (id object in setOfAllObjects) {

        dictionary[object] = @([countedSet countForObject:object]);
    }

    return dictionary.copy;
}

//We could also do it with out using CocoaTouch methods.

-(NSDictionary *)regularGetOccurancesForEachElementinArray:(NSArray *)array{

    NSMutableDictionary *dictionary = [NSMutableDictionary new];

    for (int i = 0; i<array.count; i++) {

        id currentElement = array[i];
        NSNumber *existingElementCounter = dictionary[currentElement];

        NSUInteger currentCount = existingElementCounter ? existingElementCounter.unsignedIntegerValue : 0;
        currentCount ++;
        dictionary[currentElement] = @(currentCount);
    }

    return dictionary;

}
#pragma Mark - SEARCH STUFF 

#pragma Mark - Linear Search - Running time of O(n)

-(NSUInteger )findIndexOfObjectInArrayViaLinearSearchWithArray:(NSArray *)array andObjectToFind:(id)object{

   // NSUInteger *index = 0;

    for (id obj in array) {
        if ([object isEqual:obj]) {

            return [array indexOfObject:obj];
        }
    }

    return NSNotFound;
}

#pragma Mark - Binary Search O(n)
//Binary search devides range of values into halves and continues to narrow down the field of search until the unkown value is found.
//For Binary Search - the array has be sorted. 

-(NSUInteger)findIndexOfObjectViaBinarySearchForArray:(NSArray *)array andFindObject:(id)object{

    NSUInteger firstIndex = 0;

    NSUInteger upTOIndex = [array count];

    while (firstIndex < upTOIndex) {

        NSUInteger mid = array.count / 2;


        if ([object compare:array[mid]] ==NSOrderedAscending) {
            upTOIndex = mid;

        }else if ([object compare:array[mid]] == NSOrderedDescending){
            firstIndex = mid + 1;
        }else {
            return  mid;
        }
    }

    return NSNotFound;
}

@end
