//
//  Fifo1Item.m
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import "Fifo1Item.h"

@implementation Fifo1Item

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.titulo forKey:@"titulo"];
    [aCoder encodeObject:self.llegada forKey:@"llegada"];
    [aCoder encodeObject:self.tiempo forKey:@"tiempo"];
    [aCoder encodeObject:self.arranque forKey:@"arranque"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.titulo = [aDecoder decodeObjectForKey:@"titulo"];
        self.llegada = [aDecoder decodeObjectForKey:@"llegada"];
        self.tiempo = [aDecoder decodeObjectForKey:@"tiempo"];
        self.arranque = [aDecoder decodeObjectForKey:@"arranque"];
    }
    return self;
}
@end
