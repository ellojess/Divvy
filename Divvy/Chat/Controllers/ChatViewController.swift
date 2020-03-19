//
//  ChatViewController.swift
//  Divvy
//
//  Created by Bo on 2/11/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - ChatViewController corresponds to ChatViewController.xib
 - Should haves:
    [] header:
        [] back button on left, takes user to Marketplace Page
        [] Chat label in center
*/
import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey"),
        Message(sender: "3@4.com", body: "Hello"),
        Message(sender: "1@2.com", body: "What's up?")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
    }
    
    @IBAction func sendPressed(_ sender: Any) {
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

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
}
