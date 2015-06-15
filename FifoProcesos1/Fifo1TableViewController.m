//
//  Fifo1TableViewController.m
//  FifoProcesos1
//
//  Created by iMac3 on 11/14/12.
//  Copyright (c) 2012 RenanDiaz. All rights reserved.
//

#import "Fifo1TableViewController.h"

@interface Fifo1TableViewController ()
@property (nonatomic) int arrival;
@property (nonatomic) int time;
@property (nonatomic) NSArray *idList;
@property (nonatomic) int index;
@end

@implementation Fifo1TableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.idList = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    self.index = 0;
    if (!pila)
    {
        pila = [[NSMutableArray alloc] init];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[Fifo1ItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    
    Fifo1Item *item = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    [cell.textLabel setText:item.titulo];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"Llegada: %@ Tiempo: %@", item.llegada, item.tiempo]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detalleItem"])
    {
        if ([segue.destinationViewController isKindOfClass:[Fifo1DetalleTableViewController class]])
        {
            Fifo1DetalleTableViewController *detalleViewController = segue.destinationViewController;
            NSInteger index = self.tableView.indexPathForSelectedRow.row;
            Fifo1Item *item = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:index];
            NSLog(@"Enviado: %@", item.titulo);
            detalleViewController.itemSeleccionado = item;
        }
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Fifo1Item *item = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    [[Fifo1ItemStore sharedStore] deleteItem:item];
    [self reducirIndex];
    [tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[Fifo1ItemStore sharedStore] changeOrderFrom:sourceIndexPath.row to:destinationIndexPath.row];
}

- (IBAction)addAction
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Nuevo proceso"
                                                     message:[NSString stringWithFormat:@"Información del proceso %@:", [self.idList objectAtIndex:self.index]]
                                                    delegate:self
                                           cancelButtonTitle:@"Aceptar"
                                           otherButtonTitles:nil];
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    [alert addButtonWithTitle:@"Cancelar"];
    
    UITextField *campoLlegada = [alert textFieldAtIndex:0];
    UITextField *campoTiempo = [alert textFieldAtIndex:1];
    
    campoLlegada.keyboardType = UIKeyboardTypeNumberPad;
    campoLlegada.placeholder = @"Llegada";
    campoTiempo.keyboardType = UIKeyboardTypeNumberPad;
    campoTiempo.placeholder = @"Tiempo";
    campoTiempo.secureTextEntry = NO;
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 1)
    {
        self.arrival = [alertView textFieldAtIndex:0].text.intValue;
        self.time = [alertView textFieldAtIndex:1].text.intValue;
        
        Fifo1Item *item = [[Fifo1ItemStore sharedStore] insertItem];
        item.titulo = [self.idList objectAtIndex:self.index];
        item.llegada = [alertView textFieldAtIndex:0].text;
        item.tiempo = [alertView textFieldAtIndex:1].text;
        
        [pila removeAllObjects];
        
        for (int i = 0; i <= self.index; i++)
        {
            for (int j = 0; j < self.index; j++)
            {
                Fifo1Item *it1 = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:j];
                Fifo1Item *it2 = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:j + 1];
                BOOL cambio = NO;
                
                if (it1.llegada.intValue == it2.llegada.intValue)
                {
                    if (it1.tiempo.intValue > it2.tiempo.intValue)
                    {
                        cambio = YES;
                    }
                }
                else if (it1.llegada.intValue > it2.llegada.intValue)
                {
                    cambio = YES;
                }
                
                if (cambio)
                {
                    [[Fifo1ItemStore sharedStore] changeOrderFrom:j to:j+1];
                }
            }
        }
        
        int contador = 0;
        int control = 0;
        for (int i = 0; i <= self.index; i++)
        {
            Fifo1Item *it = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:i];
            
            for (; contador < it.llegada.intValue; contador++, control++)
            {
                [pila addObject:@"Nada"];
                NSLog(@"%2i: %@\n", contador, [pila objectAtIndex:contador]);
            }
            
            for (; contador < control + [it tiempo].intValue; contador++)
            {
                [pila addObject:[it titulo]];
                NSLog(@"%2i: %@\n", contador, [pila objectAtIndex:contador]);
            }
            
            control = contador;
        }
        
        for (int i = 0; i <= self.index; i++)
        {
            contador = 0;
            Fifo1Item *it = [[[Fifo1ItemStore sharedStore] allItems] objectAtIndex:i];
            for (int j = 0; j < control; j++)
            {
                if ([[pila objectAtIndex:j] isEqualToString:it.titulo])
                {
                    it.arranque = [NSString stringWithFormat:@"%d", j];
                    break;
                }
            }
        }
        
        self.index++;
        [self.tableView reloadData];
    }
}

- (void)reducirIndex
{
    self.index--;
}


@end
