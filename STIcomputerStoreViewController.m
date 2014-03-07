//
//  STIcomputerStoreViewController.m
//  computer
//
//  Created by chuck davila rios on 01/03/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIcomputerStoreViewController.h"
#import "STIcomputerViewController.h"

@interface STIcomputerStoreViewController ()

@end

@implementation STIcomputerStoreViewController

-(id) initWithModel:(STIComputerStoreModel *) aModel
              style:(UITableViewStyle) aStyle
{
    if (self = [super initWithStyle:aStyle]) {
        _model = aModel;
        self.title = @"Computer Store";
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.13
                                                                              green:0.5
                                                                               blue:0.2
                                                                              alpha:1];
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

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == DESKTOP_COMPUTER_SECTION) {
        return @"desktop Computers";
    }else if (section == LAPTOP_COMPUTER_SECTION){
        return @"laptop Computers";
    }else{
        return @"other Computers";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (section == DESKTOP_COMPUTER_SECTION) {
        return self.model.desktopComputerCount;
    }else if (section == LAPTOP_COMPUTER_SECTION){
        return self.model.laptopComputerCount;
    }else{
        return self.model.otherComputerCount;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        //tenemos que crearla manualmente
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    //averiguar de qué modelo nos están hablando
    STIcomputerModel * computer = nil;
    if (indexPath.section == DESKTOP_COMPUTER_SECTION) {
        computer = [self.model desktopComputerAtIndex:indexPath.row];
    }else if (indexPath.section == LAPTOP_COMPUTER_SECTION){
        computer = [self.model laptopComputerAtIndex:indexPath.row];
    }else{
        computer = [self.model otherComputerAtIndex:indexPath.row];
    }
    
    //sincronizar vista (celda) y modelo (computadora)
    cell.imageView.image = computer.photo;
    cell.textLabel.text = computer.modelComputer;
    cell.detailTextLabel.text = computer.computerCompany;
    
    
    // devolvemos la celda
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - TableView Delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //suponemos que estamos dentro de un navigationControler
    
    //averiguamos de qué computadora se trata
    STIcomputerModel * computer = nil;
    if (indexPath.section == DESKTOP_COMPUTER_SECTION) {
        computer = [self.model desktopComputerAtIndex:indexPath.row];
    }else if (indexPath.section == LAPTOP_COMPUTER_SECTION){
        computer = [self.model laptopComputerAtIndex:indexPath.row];
    }else{
        computer = [self.model otherComputerAtIndex:indexPath.row];
    }
    
    /*
    //luego creamos un controlador para dicha computadora
    STIcomputerViewController *computerVC = [[STIcomputerViewController alloc] initWithModel:computer];
    
    //hacemos un push al navigationControler dentro del cual estamos
    [self.navigationController pushViewController:computerVC animated:YES];*/
    
    
    [self.delegate computerStoreViewController:self
                           didSelectedComputer:computer];
    
    //notificaciones
    NSNotification *notif = [NSNotification notificationWithName:NEW_COMPUTER_NOTIFICATION_NAME
                                                          object:self
                                                        userInfo:@{COMPUTER_KEY: computer}];
    
    [[NSNotificationCenter defaultCenter] postNotification:notif];
    
    
    //Guardar la última computadora selecccionada
    [self saveLastComputerSelectedAtSection:indexPath.section row:indexPath.row];
}


#pragma mark -computerStoreViewControllerDelegate
-(void) computerStoreViewController:(STIcomputerStoreViewController *) computerStoreVC
                didSelectedComputer:(STIcomputerModel *) aComputer
{
    //creamos el controlador
    STIcomputerViewController *computerVC = [[STIcomputerViewController alloc] initWithModel:aComputer];
    
    [self.navigationController pushViewController:computerVC animated:YES];
}


#pragma mark - Utils
-(STIcomputerModel *) computerForIndexPath:(NSIndexPath *) indexPath
{
    //averiguamos de que computadora se trata
    STIcomputerModel *computer = nil;
    
    if (indexPath.section == DESKTOP_COMPUTER_SECTION) {
        computer = [self.model desktopComputerAtIndex:indexPath.row];
    }else if (indexPath.section == LAPTOP_COMPUTER_SECTION){
        computer = [self.model laptopComputerAtIndex:indexPath.row];
    }else{
        computer = [self.model otherComputerAtIndex:indexPath.row];
    }
    
    return computer;
}



#pragma mark - NSUserDefaullts

//este método es creado para que la primera vez que se arranque la aplicacion cargue una computadora por default (ya que el usuario aun no elige alguna)
-(NSDictionary *) setDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary * defaultComputerCoords = @{SECTION_KEY: @(DESKTOP_COMPUTER_SECTION), ROW_KEY:@0};
    
    [defaults setObject: defaultComputerCoords forKey:LAST_COMPUTER_KEY];
    
    [defaults synchronize];
    
    return defaultComputerCoords;
}

-(void) saveLastComputerSelectedAtSection: (NSUInteger) section row:(NSUInteger) row
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject: @{SECTION_KEY: @(section), ROW_KEY:@(row)} forKey:LAST_COMPUTER_KEY];
    
    [defaults synchronize];
}

-(STIcomputerModel *) lastSelectedComputer
{
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_COMPUTER_KEY];
    
    if (coords == nil) {
        //no habia nada bajo la clave LAST_COMPUTER_KEY
        //Esto quiere decir que es la primera vez que se llama a la app
        //ponemos un valor por defecto: la primera de las desktop
        
        coords = [self setDefaults];
    }else{
        //ya hay algo que en algun momento se guardó
        //y no hay nada especial que hacer
    }
    
    //transformamos las coordenadas en un indexPath
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY] integerValue] inSection:[[coords objectForKey:SECTION_KEY] integerValue]];
    
    return [self computerForIndexPath:indexPath];
}


@end
