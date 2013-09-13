//
//  SecondViewController.m
//  iClothes
//
//  Created by Shi Lin on 8/15/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "MyClothesViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <JSONKit/JSONKit.h>

@interface MyClothesViewController (){

    AFHTTPClient *httpClient;
}

@end

@implementation MyClothesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://112.124.37.216"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onQueryScan:(id)sender{
    [httpClient GET:@"barcode-code/123" parameters:Nil success:^(NSHTTPURLResponse *response, id responseObject) {
        NSLog(@"%@",responseObject);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"response" message:[responseObject JSONString] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"okay", nil];
        [alertView show];
    } failure:^(NSError *error) {
        //
    }];
}

/*
 http://112.124.37.216/barcodes
 功能：导入条码
 POST {
 "product":{"id":"52286443bb9971169b000002"},
 "code":"123"
 }
*/
 
- (IBAction)importBarcode:(id)sender{
    NSDictionary *para = [NSDictionary dictionaryWithObjectsAndKeys:@"123",@"code",@{@"id":@"52286443bb9971169b000002"},@"product", nil];
    
    [httpClient POST:@"barcodes" parameters:para success:^(NSHTTPURLResponse *response, id responseObject) {
        NSLog(@"%@",responseObject);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"response" message:[responseObject JSONString] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"okay", nil];
        [alertView show];
    } failure:^(NSError *error) {
        //
        NSLog(@"%@",error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"response" message:[error description] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"okay", nil];
        [alertView show];
    }];
}

/*
 http://112.124.37.216/login
 功能：登录
 POST {
 "name":"刘典",
 "accesstoken":"1234567890",
 "secret":"abcdefg"
 }
 */
- (IBAction)login:(id)sender{
    
    NSDictionary *para = [NSDictionary dictionaryWithObjectsAndKeys:@"刘典",@"name",@"1234567890",@"accesstoken",@"abcdefg",@"secret", nil];
    

    AFHTTPClient *httpClient3 = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://112.124.37.216"]];
    
    [httpClient3 POST:@"login" parameters:para success:^(NSHTTPURLResponse *response, id responseObject) {
        NSLog(@"%@",responseObject);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"response" message:[responseObject JSONString] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"okay", nil];
        [alertView show];
    } failure:^(NSError *error) {
        //
        NSLog(@"%@",error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"response" message:[error description] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"okay", nil];
        [alertView show];
    }];
}

@end
