//
//  SecondViewController.m
//  Serrure
//
//  Created by Nicolas on 23/03/2015.
//  Copyright (c) 2015 Nicolas Montvernay. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    
    // Déclarations
    NSString *ip, *user, *psswd;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Recupération des infos sauvegardées
    ip = [defaults objectForKey:@"IP"];
    user = [defaults objectForKey:@"User"];
    psswd = [defaults objectForKey:@"Password"];
    
    // Restitution des infos récupérées
    ipTextField.text = ip;
    userTextField.text = user;
    psswdTextField.text = psswd;
    
    [super viewDidLoad];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)saveButtonPressed:(id)sender {
    
    // Déclaration
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Sauvegarde des infos
    [defaults setObject:ipTextField.text forKey:@"IP"];
    [defaults setObject:userTextField.text forKey:@"User"];
    [defaults setObject:psswdTextField.text forKey:@"Password"];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
