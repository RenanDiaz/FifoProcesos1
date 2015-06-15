//
//  Fifo1DetalleTableViewController.h
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fifo1Item.h"
#import "Fifo1ItemStore.h"

@interface Fifo1DetalleTableViewController : UITableViewController
@property (weak, nonatomic) Fifo1Item *itemSeleccionado;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@end
