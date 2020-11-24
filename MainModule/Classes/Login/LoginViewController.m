//
//  LoginViewController.m
//  Login
//
//  Created by Jlius Suweno on 20/11/20.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loginPressed:(id)sender {
    NSString *userID = _userIDTextField.text;
    NSString *password = _passwordTextField.text;
    
    if ([userID length] == 0) {
        [self ShowAlert:@"Silahkan isi User ID dahulu"];
    } else if ([password length] == 0) {
        [self ShowAlert:@"Silahkan isi Password dahulu"];
    } else if ([userID  isEqual: @"admin"] && [password  isEqual: @"123"]) {
        HomeViewController *homeVC = [[HomeViewController alloc]init];
        homeVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:homeVC animated:YES completion:nil];
    } else {
        [self ShowAlert:@"Maaf, user ID dan password Anda salah, silahkan ulangi kembali."];
    }
}
- (IBAction)registerPressed:(id)sender {
    RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
    registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerViewController animated:YES completion:nil];
}

- (void) ShowAlert:(NSString *)Message {
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:nil
                                                                  message:@""
                                                           preferredStyle:UIAlertControllerStyleAlert];
    UIView *firstSubview = alert.view.subviews.firstObject;
    UIView *alertContentView = firstSubview.subviews.firstObject;
    for (UIView *subSubView in alertContentView.subviews) {
        subSubView.backgroundColor = [UIColor colorWithRed: 42/255.0f green:199/255.0f blue:254/255.0f alpha:1.0f];
    }
    NSMutableAttributedString *AS = [[NSMutableAttributedString alloc] initWithString:Message];
    [AS addAttribute: NSForegroundColorAttributeName value: [UIColor whiteColor] range: NSMakeRange(0,AS.length)];
    [alert setValue:AS forKey:@"attributedTitle"];
    [self presentViewController:alert animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:^{
        }];
    });
}
@end
