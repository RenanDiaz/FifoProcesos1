//
//  Fifo1ItemStore.m
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import "Fifo1ItemStore.h"

@implementation Fifo1ItemStore
+ (Fifo1ItemStore *)sharedStore {
    static Fifo1ItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id)allocWithZone:(NSZone *)zone {
    return [self sharedStore];
}

-(id)init {
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        items = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!items){
            items = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)allItems {
    return items;
}

-(Fifo1Item *)insertItem {
    Fifo1Item *item = [[Fifo1Item alloc] init];
    [items addObject:item];
    return item;
}

-(void)deleteItem:(Fifo1Item *)item
{
    [items removeObjectIdenticalTo:item];

}

-(void)changeOrderFrom:(NSInteger)from To:(NSInteger)to
{
    if (to != from) {
        id obj = [items objectAtIndex:from];
        [items removeObjectAtIndex:from];
        if (to <= [items count]) {
            [items addObject:obj];
        } else {
            [items insertObject:obj atIndex:to];
        }
    }
}

-(NSString *)itemArchivePath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

-(BOOL)saveChanges {
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:items toFile:path];
}

@end
