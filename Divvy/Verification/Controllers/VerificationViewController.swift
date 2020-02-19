//
//  VerificationViewController.swift
//  Divvy
//
//  Created by Bo on 2/11/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - VerificationViewController corresponds to VerificationViewController.xib
 - Should haves:
    [] label "We need to verify you're human"
    [] textfield for phone number
    [] number pad keyboard popup after textfield is pressed
    [] button "Send Code" that takes users to ConfirmCode Page
    [] second button that says "Continue as guest" -- takes users to marketplace page

*/
import UIKit

class VerificationViewController: UIViewController {
    @IBOutlet weak var SendCodeButton: UIButton!
    @IBOutlet weak var BackToLoginButton: UIButton!
    @IBOutlet weak var PhoneNumberEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SendCodeTapped(_ sender: UIButton) {
        let nextVC = ConfirmCodeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func BackToLoginTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
//        let nextVC = MarketplaceViewController()
//        self.navigationController?.pushViewController(nextVC, animated: true)
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
