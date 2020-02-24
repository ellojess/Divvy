//
//  SignUpViewController.swift
//  Divvy
//
//  Created by Bo on 2/11/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - SignUpViewController corresponds to SignUpViewController.xib
 - Should haves:
    [] 3 text fields:
        [] first name
        [] last name
        [] password
    [] Button to "Create Account", goes to Verification Page
    [] Button "go back to login", goes to Login Page

*/
import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var GoBackToLoginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccountTapped(_ sender: UIButton) {
        let nextVC = VerificationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        // execute only if email and password aren't empty
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // TODO: Create pop up for user to see error later on
                    print(e.localizedDescription)
                } else {
                    //TODO: Navigate to Maketplace
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
    @IBAction func googleButtonTapped(_ sender: UIButton) {
        let nextVC = MarketplaceViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func GoBackToLoginTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
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
