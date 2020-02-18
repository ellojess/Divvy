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

class LoginViewController: UIViewController {
    //Test 1
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginViewTapped(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let nextVC = mainStoryboard.instantiateViewController(withIdentifier: "nextVC") as? ViewController else {
          return print("storyboard not set up correctly, check the identity of \"nextVC\"")
        }

        present(nextVC, animated: true, completion: nil)
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
