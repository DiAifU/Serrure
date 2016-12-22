//
//  OpenCloseViewController.h
//  Serrure
//
//  Created by Nicolas on 23/03/2015.
//  Copyright (c) 2015 Nicolas Montvernay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NMSSH/NMSSH.h>

@interface OpenCloseViewController : UIViewController {
    NSString *ip;
    NSString *user;
    NSString *psswd;
    IBOutlet UIActivityIndicatorView *indicatorView;
    NMSSHSession *session;
    IBOutlet UIButton *openButton;
    IBOutlet UIButton *closeButton;
    IBOutlet UILabel *statusLabel;
}

- (IBAction)openButtonPressed:(id)sender;
- (IBAction)closeButtonPressed:(id)sender;


@end

