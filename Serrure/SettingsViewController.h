//
//  SettingsViewController.h
//  Serrure
//
//  Created by Nicolas on 23/03/2015.
//  Copyright (c) 2015 Nicolas Montvernay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet UITextField *ipTextField;
    IBOutlet UITextField *userTextField;
    IBOutlet UITextField *psswdTextField;
}
- (IBAction)saveButtonPressed:(id)sender;

@end

