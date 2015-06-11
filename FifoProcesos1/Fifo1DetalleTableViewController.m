//
//  Fifo1DetalleTableViewController.m
//  FifoProcesos1
//
//  Created by iMac3 on 11/20/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import "Fifo1DetalleTableViewController.h"

@interface Fifo1DetalleTableViewController ()
@end

@implementation Fifo1DetalleTableViewController
@synthesize itemSeleccionado;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    // Cargamos los valores de BO al cargar la pantalla
    [[self tableView] reloadData];
    [_navBar setTitle:[[NSString stringWithFormat:@"Proceso "] stringByAppendingString:[itemSeleccionado titulo]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell2"];
    
    int f, t, w;
    float p;
    
    f = [itemSeleccionado arranque].intValue + [itemSeleccionado tiempo].intValue;
    t = f - [itemSeleccionado llegada].intValue;
    w = t - [itemSeleccionado tiempo].intValue;
    p = (float)t / [itemSeleccionado tiempo].floatValue;
    
    if (indexPath.row == 0) {
        [[cell detailTextLabel] setText:[itemSeleccionado llegada]];
        [[cell textLabel] setText:@"Llegada"];
    }
    if (indexPath.row == 1) {
        [[cell detailTextLabel] setText:[itemSeleccionado tiempo]];
        [[cell textLabel] setText:@"t"];
    }
    if (indexPath.row == 2) {
        [[cell detailTextLabel] setText:[itemSeleccionado arranque]];
        [[cell textLabel] setText:@"Arranque"];
    }
    if (indexPath.row == 3) {
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d", f]];
        [[cell textLabel] setText:@"Fin"];
    }
    if (indexPath.row == 4) {
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d", t]];
        [[cell textLabel] setText:@"T"];
    }
    if (indexPath.row == 5) {
        
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d", w]];
        [[cell textLabel] setText:@"W"];
    }
    if (indexPath.row == 6) {
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%0.1f", p]];
        [[cell textLabel] setText:@"P"];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
