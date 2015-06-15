//
//  Fifo1DetalleTableViewController.m
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import "Fifo1DetalleTableViewController.h"

@implementation Fifo1DetalleTableViewController

- (void)viewDidLoad
{
    // Cargamos los valores de BO al cargar la pantalla
    [self.tableView reloadData];
    [self.navBar setTitle:[NSString stringWithFormat:@"Proceso %@", self.itemSeleccionado.titulo]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell2"];
    
    int f, t, w;
    float p;
    
    f = self.itemSeleccionado.arranque.intValue + self.itemSeleccionado.tiempo.intValue;
    t = f - self.itemSeleccionado.llegada.intValue;
    w = t - self.itemSeleccionado.tiempo.intValue;
    p = (float)t / self.itemSeleccionado.tiempo.floatValue;
    
    if (indexPath.row == 0) {
        [cell.detailTextLabel setText:self.itemSeleccionado.llegada];
        [cell.textLabel setText:@"Llegada"];
    }
    if (indexPath.row == 1) {
        [cell.detailTextLabel setText:self.itemSeleccionado.tiempo];
        [cell.textLabel setText:@"t"];
    }
    if (indexPath.row == 2) {
        [cell.detailTextLabel setText:self.itemSeleccionado.arranque];
        [cell.textLabel setText:@"Arranque"];
    }
    if (indexPath.row == 3) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d", f]];
        [cell.textLabel setText:@"Fin"];
    }
    if (indexPath.row == 4) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d", t]];
        [cell.textLabel setText:@"T"];
    }
    if (indexPath.row == 5) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d", w]];
        [cell.textLabel setText:@"W"];
    }
    if (indexPath.row == 6) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%0.1f", p]];
        [cell.textLabel setText:@"P"];
    }
    return cell;
}

@end
