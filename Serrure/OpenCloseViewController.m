//
//  OpenCloseViewController.m
//  Serrure
//
//  Created by Nicolas on 23/03/2015.
//  Copyright (c) 2015 Nicolas Montvernay. All rights reserved.
//

#import "OpenCloseViewController.h"

@interface OpenCloseViewController ()

@end

@implementation OpenCloseViewController

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    ip = [defaults objectForKey:@"IP"];
    user = [defaults objectForKey:@"User"];
    psswd = [defaults objectForKey:@"Password"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        session = [NMSSHSession connectToHost:ip
                                 withUsername:user];
            if (session.isConnected) {
                [session authenticateByPassword:psswd];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (session.isAuthorized) {
                statusLabel.text = @"Connecté";
                openButton.enabled = YES;
                closeButton.enabled = YES;
            }
            else {
                statusLabel.text = @"Authentif. échouée";
            }
        });
    });
}


- (IBAction)openButtonPressed:(id)sender {
    [indicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        if (session.isConnected && session.isAuthorized) {
            NSError *error = nil;
            NSString *response = [session.channel execute:@"sudo python ./Serrure/open.py" error:&error];
            NSLog(@"Réponse ouverture : %@", response);
        }

        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [indicatorView stopAnimating];
        });
    });
}


- (IBAction)closeButtonPressed:(id)sender {
    [indicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        if (session.isConnected && session.isAuthorized) {
            NSError *error = nil;
            NSString *response = [session.channel execute:@"sudo python ./Serrure/close.py" error:&error];
            NSLog(@"Réponse fermeture : %@", response);
        }
        
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [indicatorView stopAnimating];
        });
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
 }

@end
