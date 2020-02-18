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

class SignUpViewController: UIViewController {
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var GoBackToLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccountTapped(_ sender: UIButton) {
        let nextVC = VerificationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
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
