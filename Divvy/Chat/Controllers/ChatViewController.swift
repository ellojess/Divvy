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
    
    // database for Firestore
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        // dummy data for testing
//        Message(sender: "1@2.com", body: "Hey"),
//        Message(sender: "3@4.com", body: "Hello"),
//        Message(sender: "1@2.com", body: "What's up?")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    // helper func to load messages from Firestore
    func loadMessages() {
        // closure called to retrieve data from database
        // https://cloud.google.com/nodejs/docs/reference/firestore/0.11.x/QueryDocumentSnapshot
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in

            self.messages = []
            
            if let e = error {
                print("there was an issue retrieving data from Firestore. \(e)")
            } else {
                // retrieve data from Firestore
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        // Conditional downcast sender and messageBody to string because data type is any. Note: Do not remove or change type-casting
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            // add live messages to messages array, store in Firestore
                            self.messages.append(newMessage)
                            
                            // trigger data source methods in tableView
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                // scroll to last row (ie latest sent message) in table view
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        // if there is a message in the textfield and there is a user logged in (both not nil) then send data to firestore
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("issue saving data to firestore, \(e)")
                } else {
                    print("yay, data saved")
                    
                    DispatchQueue.main.async {
                        self.messageTextField.text = ""
                    }
                }
                                                                        
            }
            
        }
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
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        // check if message sender is the same as the logged in user
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: "divvyLightBlue")
            cell.label.textColor = UIColor.white
        }
        // message from another sender
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: "divvyLightPurple")
            cell.label.textColor = UIColor(named: "divvyBlue")
        }
        
        return cell
    }
}
