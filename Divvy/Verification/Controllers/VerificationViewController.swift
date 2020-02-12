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
        - 2 views:
            - View1:
                [] label "We need to verify you're human"
                [] textfield for phone number
                [] number pad keyboard popup after textfield is pressed
                [] button "Send Code" that takes users to View2
                [] second button that says "Continue as guest" -- takes users to marketplace page
 
            - View2:
                [] label stating we sent code to phone number
                [] text field for user input
                [] button that says verify
                [] number pad keyboard popup after textfield is pressed
                [] another button that says resend
                [] label asking "Didn't recieve code?"
                [] Resend button under label
*/
import UIKit

class VerificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
