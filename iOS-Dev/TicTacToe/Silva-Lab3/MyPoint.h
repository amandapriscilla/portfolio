//
//  MyPoint.h
//  Silva-Lab3
//
//  Created by Labuser on 2/16/13.
//  Copyright (c) 2013 Labuser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPoint : NSObject{
@public
    int x;
    int y;
    char value;
}
/*
@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic, assign) int value;
*/
-(id)initWithValues:(int)X y:(int)Y value:(char)V;
-(id)initWithValues:(int)X y:(int)Y;
- (BOOL) hasValue;


@end
