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
}

@end
