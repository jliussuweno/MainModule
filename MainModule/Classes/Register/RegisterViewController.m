//
//  RegisterViewController.m
//  Register
//
//  Created by Jlius Suweno on 20/11/20.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)registerButtonPressed:(id)sender {
    NSString *name = _nameTextField.text;
    NSString *email = _emailTextField.text;
    NSString *userID = _userIDTextField.text;
    NSString *password = _passwordTextField.text;
    NSString *confirmPassword = _confirmPasswordTextField.text;
    
    if ([name length] == 0){
        [self showAlert:@"Nama harus diisi."];
    } else if([email length] == 0){
        [self showAlert:@"Email harus diisi."];
    } else if([userID length] == 0){
        [self showAlert:@"User ID harus diisi."];
    } else if ([password length] == 0){
        [self showAlert:@"Password harus diisi."];
    } else if ([confirmPassword length] == 0){
        [self showAlert:@"Confirm Password harus diisi."];
    } else if (![password isEqualToString:confirmPassword]){
        [self showAlert:@"Confirm Password harus diisi."];
    } else {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:loginVC animated:YES completion:nil];
    }

}

- (IBAction)loginButtonPressed:(id)sender {
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (void)showAlert:(NSString *)Message {
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
