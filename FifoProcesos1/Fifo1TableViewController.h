//
//  Fifo1TableViewController.h
//  FifoProcesos1
//
//  Created by iMac3 on 11/14/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fifo1ItemStore.h"
#import "Fifo1Item.h"
#import "Fifo1DetalleTableViewController.h"

@interface Fifo1TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *pila;
}

-(void)reducirIndex;

@end