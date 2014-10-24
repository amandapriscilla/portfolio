//
//  MyPoint.m
//  Silva-Lab3
//
//  Created by Labuser on 2/17/13.
//  Copyright (c) 2013 Labuser. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

- (id)init {
    if(self = [super init]){
        x = 0;
        y = 0;
        value = 0;
    }
    return (self);
}

-(id)initWithValues:(int)X y:(int)Y{
    self = [super init];
    if(self){
        x = X;
        y = Y;
    }
    return (self);
}

-(id)initWithValues:(int)X y:(int)Y value:(char)V{
    self = [super init];
    if(self){
        x = X;
        y = Y;
        value = V;
    }
    return (self);
}

-(BOOL)hasValue{
    return value!=0;
}

@end
