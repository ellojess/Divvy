//
//  LoginViewController.swift
//  Divvy
//
//  Created by Bo on 2/11/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - LoginViewController corresponds to LoginViewController.xib
 - Should haves:
    [] textfield for cell
    [] textfield for password
    [] "Login" button, takes user to marketplace page
    [] "Continue with Google" button, takes user to marketplace page
    [] "Create New Account" button, takes users to SignUp page
*/
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Test 1
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var GoogleButton: UIButton!
    @IBOutlet weak var CreateAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginViewTapped(_ sender: UIButton) {
        let nextVC = TabBarController()
        
//        if let email = emailTextfield.text, let password = passwordTextField.text {
//            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                if let e = error {
//                    // TODO: Implement popup displaying error to user
//                    print(e.localizedDescription)
//                } else {
//                    self.navigationController?.pushViewController(nextVC, animated: true)
//                }
//        }
//
//
//        }
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func continueWithGoogleTapped(_ sender: UIButton) {
        let nextVC = TabBarController()
        
        let alert = UIAlertController(title: "Hello, Guest! Welcome to Divvy(:", message: "You will not have access to all the features a verified member would, such as being able to message and talk to other members. But feel free to explore and make an account when you're ready", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Okay!", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.navigationController?.pushViewController(nextVC, animated: true)
        self.present(alert, animated: true, completion: nil)
        
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func CreateAccountTapped(_ sender: UIButton) {
        let nextVC = SignUpViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
