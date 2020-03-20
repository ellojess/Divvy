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
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey"),
        Message(sender: "3@4.com", body: "Hello"),
        Message(sender: "1@2.com", body: "What's up?")
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
        messages = []
        
        // https://cloud.google.com/nodejs/docs/reference/firestore/0.11.x/QueryDocumentSnapshot
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("there was an issue retrieving data from firestore")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        print(doc.data())
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
                K.FStore.bodyField: messageBody
            ]) { (error) in
                if let e = error {
                    print("issue saving data to firestore, \(e)")
                } else {
                    print("yay, data saved")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
}
