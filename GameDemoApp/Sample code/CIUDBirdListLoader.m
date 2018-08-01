//
//  CIUDBirdListLoader.m
//  PracticeProject
//
//  Created by Deepak P. Patil on 19/08/16.
//  Copyright © 2016 Deepak P. Patil. All rights reserved.
//

#import "CIUDBirdListLoader.h"
#import "Constants.h"
@interface CIUDBirdListLoader()
@property (nonatomic, strong) NSMutableArray *birdListArray;

@end
@implementation CIUDBirdListLoader
+ (id)sharedBirdLoader {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}



- (id)init {
    self = [super init];
    if (self)
    {
        NSString *defaultFilePath = [[NSBundle mainBundle] pathForResource:@"BirdsList" ofType:@"plist"];
       
       _birdListArray= [self birdListForPath:defaultFilePath];
         DebugLog(@"Birds Loaded %@",_birdListArray);
    }
    return self;
}
- (NSMutableArray*)birdListForPath:(NSString*)themePath
{
    //    NSString *path = [themePath stringByAppendingPathComponent:@"defaults.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:themePath]) {
        return [NSMutableArray arrayWithContentsOfFile:themePath];
    }
    
    return nil;
}
@end
