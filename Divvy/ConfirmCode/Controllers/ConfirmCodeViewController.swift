//
//  ConfirmCodeViewController.swift
//  Divvy
//
//  Created by Bo on 2/12/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - VerificationViewController corresponds to VerificationViewController.xib
 - Should haves:
    [] label stating "we sent code to phone number"
    [] text field for user input/special code
    [] button that says "verify", for MVP it should take users to Marketplace Page
    [] number pad keyboard popup after textfield is pressed
    [] another button that says resend
    [] label asking "Didn't recieve code?"
    [] Resend button under label
*/
import UIKit

class ConfirmCodeViewController: UIViewController {
    @IBOutlet weak var VerifyButton: UIButton!
    @IBOutlet weak var ResendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func VerifyTapped(_ sender: UIButton) {
        let nextVC = CollectionMarketViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
