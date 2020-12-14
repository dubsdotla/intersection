//
//  main.m
//  IntersectionObjC
//
//  Created by Derek William Scott on 12/13/20.
//

#import <Foundation/Foundation.h>

@interface IntersectionClass:NSObject
- (NSArray*) intersectionWithFirstArray: (NSArray*)firstarray andSecondArray: (NSArray *)secondarray;
@end

@implementation IntersectionClass

- (id)init {
    self = [super init];

    return self;
}

- (NSArray*) intersectionWithFirstArray: (NSArray*)firstarray andSecondArray: (NSArray *)secondarray
{
    NSMutableDictionary* firstCountDict = [NSMutableDictionary dictionary];
    NSMutableDictionary* secondCountDict = [NSMutableDictionary dictionary];
    
    for (NSNumber* number in firstarray) {
        if ([firstCountDict valueForKey:[NSString stringWithFormat: @"%d", number.intValue]] != NULL) {
            int count =  [[firstCountDict valueForKey:[NSString stringWithFormat: @"%d", number.intValue]] intValue] + 1;
            
            [firstCountDict setValue:[NSNumber numberWithInt:count] forKey:[NSString stringWithFormat: @"%d", number.intValue]];
        }
        
        else {
            [firstCountDict setValue:[NSNumber numberWithInt:1] forKey:[NSString stringWithFormat: @"%d", number.intValue]];
        }
        
    }
        
    for (NSNumber* number in secondarray) {
        if ([secondCountDict valueForKey:[NSString stringWithFormat: @"%d", number.intValue]] != NULL) {
            int count =  [[secondCountDict valueForKey:[NSString stringWithFormat: @"%d", number.intValue]] intValue] + 1;
            
            [secondCountDict setValue:[NSNumber numberWithInt:count] forKey:[NSString stringWithFormat: @"%d", number.intValue]];
        }
        
        else {
            [secondCountDict setValue:[NSNumber numberWithInt:1] forKey:[NSString stringWithFormat: @"%d", number.intValue]];
        }
        
    }
        
    NSMutableOrderedSet *intersectSet = [NSMutableOrderedSet orderedSetWithArray:firstarray];
    [intersectSet intersectOrderedSet:[NSMutableOrderedSet orderedSetWithArray:secondarray]];

    
    NSMutableArray* intersectArray = [NSMutableArray array];
    
    for (NSNumber* number in intersectSet) {
                
        int count = 0;
        
        NSNumber* firstCount = [firstCountDict valueForKey:[NSString stringWithFormat: @"%d", number.intValue]];
                                
        NSNumber* secondCount = [secondCountDict valueForKey:[NSString stringWithFormat: @"%d", number.intValue]];
        
        if (firstCount.intValue >= secondCount.intValue) {
            count = secondCount.intValue;
        }
        
        else {
            count = firstCount.intValue;
        }
        
        int index = 0;
        
        while (index < count) {
            [intersectArray addObject:number];
            index++;
        }
        
    }
        
    return intersectArray;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        IntersectionClass* myIntersect = [[IntersectionClass alloc] init];
        
        NSArray* array1 = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:1],
                           [NSNumber numberWithInt:2],
                           [NSNumber numberWithInt:3],
                           [NSNumber numberWithInt:4],
                           [NSNumber numberWithInt:2],
                           nil];
        
        NSArray* array2 = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:2],
                           [NSNumber numberWithInt:2],
                           nil];
        
        NSArray* array3 = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:1],
                           [NSNumber numberWithInt:2],
                           [NSNumber numberWithInt:1],
                           [NSNumber numberWithInt:2],
                           nil];
        
        NSArray* array4 = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:1],
                           [NSNumber numberWithInt:2],
                           [NSNumber numberWithInt:3],
                           nil];
        
        NSArray* array5 = [NSArray array];
        
        NSLog(@"%@", [myIntersect intersectionWithFirstArray:array1 andSecondArray:array2]);
        NSLog(@"%@", [myIntersect intersectionWithFirstArray:array1 andSecondArray:array4]);
        NSLog(@"%@", [myIntersect intersectionWithFirstArray:array3 andSecondArray:array2]);
        NSLog(@"%@", [myIntersect intersectionWithFirstArray:array2 andSecondArray:array4]);
        NSLog(@"%@", [myIntersect intersectionWithFirstArray:array2 andSecondArray:array5]);
    }
    return 0;
}
