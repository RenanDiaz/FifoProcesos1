//
//  Fifo1ItemStore.h
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fifo1Item.h"
#import "Fifo1TableViewController.h"

@interface Fifo1ItemStore : NSObject
{
    NSMutableArray *items;
}

+ (Fifo1ItemStore *)sharedStore;
- (NSArray *)allItems;

- (Fifo1Item *)insertItem;

- (void)deleteItem:(Fifo1Item *)item;
- (void)changeOrderFrom:(NSInteger)from to:(NSInteger)to;

- (BOOL)saveChanges;
@end
