//
//  GradientTypesTableViewController.m
//  GradientExample
//
//  Created by Shakir Ali on 21/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "GradientTypesTableViewController.h"
#import "LinearGradientViewController.h"
#import "RadialGradientViewController.h"
#import "RadialGradientFullViewController.h"
#import "GrayScaleViewController.h"

@interface GradientTypesTableViewController ()
-(void)displayLinearGraidentViewController;
-(void)displayRadialGradientViewController;
-(void)displayRadialGradientFullViewController;
-(void)displayGrayScaleViewController;
@end

@implementation GradientTypesTableViewController

-(void)viewDidLoad{
	self.title = NSLocalizedString(@"Gradient",nil);
}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    if (indexPath.section == 0 && indexPath.row == 0 )
		cell.textLabel.text = NSLocalizedString(@"Linear Gradient",nil);
	if (indexPath.section == 1 && indexPath.row == 0 )
		cell.textLabel.text = NSLocalizedString(@"Radial Gradient",nil);
	if (indexPath.section == 2 && indexPath.row == 0 )
		cell.textLabel.text = NSLocalizedString(@"Radial Gradient Full view",nil);
	if (indexPath.section == 3 && indexPath.row == 0 )
		cell.textLabel.text = NSLocalizedString(@"Gray scale image",nil);
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case 0:
			[self displayLinearGraidentViewController];
			break;
		case 1:
			[self displayRadialGradientViewController];
			break;
		case 2:
			[self displayRadialGradientFullViewController];
			break;
		case 3:
			[self displayGrayScaleViewController];
			break;
		default:
			break;
	}
}

-(void)displayLinearGraidentViewController{
	LinearGradientViewController* gradientViewController = [[LinearGradientViewController alloc] init];
	[self.navigationController pushViewController:gradientViewController animated:YES];
	[gradientViewController release];
}

-(void)displayRadialGradientViewController{
	RadialGradientViewController* gradientViewController = [[RadialGradientViewController alloc] init];
	[self.navigationController pushViewController:gradientViewController animated:YES];
	[gradientViewController release];
}

-(void)displayRadialGradientFullViewController{
	RadialGradientFullViewController* gradientViewController = [[RadialGradientFullViewController alloc] init];
	[self.navigationController pushViewController:gradientViewController animated:YES];
	[gradientViewController release];
}

-(void)displayGrayScaleViewController{
	GrayScaleViewController* grayScaleViewController = [[GrayScaleViewController alloc] init];
	[self.navigationController pushViewController:grayScaleViewController animated:YES];
	[grayScaleViewController release];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

