//
//  Fifo1Item.m
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import "Fifo1Item.h"

@implementation Fifo1Item
@synthesize titulo, llegada, tiempo, arranque;

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:titulo forKey:@"titulo"];
    [aCoder encodeObject:llegada forKey:@"llegada"];
    [aCoder encodeObject:tiempo forKey:@"tiempo"];
    [aCoder encodeObject:arranque forKey:@"arranque"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        [self setTitulo:[aDecoder decodeObjectForKey:@"titulo"]];
        [self setLlegada:[aDecoder decodeObjectForKey:@"llegada"]];
        [self setTiempo:[aDecoder decodeObjectForKey:@"tiempo"]];
        [self setArranque:[aDecoder decodeObjectForKey:@"arranque"]];
    }
    return self;
}
@end
