//
//  LoginViewController.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    var viewModel: LoginViewModelProtocol = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let userName = userNameTextField.text ?? String()
        let password = passwordTextField.text ?? String()
        if viewModel.login(userName: userName , password:  password) {
            performSegue(withIdentifier: Constants.PerformSegues.list, sender: nil)
        } else {
            let alert = UIAlertController(title: Constants.TextConstants.fail, message: Constants.TextConstants.failDesc, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: Constants.TextConstants.ok, style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
