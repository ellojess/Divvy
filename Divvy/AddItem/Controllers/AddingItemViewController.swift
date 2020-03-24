//
//  AddingItemViewController.swift
//  Divvy
//
//  Created by Henry Calderon on 3/23/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class AddingItemViewController: UIViewController {
    //MARK: Item Fields
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var itemPriceField: UITextField!
    @IBOutlet weak var itemQuantityField: UITextField!
    //MARK: Buttons
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    //For when I add in an opperational Category Picker
    var pickerCategories: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         pickerCategories = ["Vegetable","Fruit","Meat & Seafood","Grain","Canned","Dairy","Baked Goods","Candy","Chips","Drink","Baby","Pet","Health & Wellness","Personal Care","Household","Other"]
    }
    
    //MARK: Actions
    @IBAction func addItemPressed(_ sender: UIButton) {
        var persistenceLayer = PersistenceLayer()
//        gaurd let itemImages. itemImag
        guard let name = itemNameField.text else { return }
        guard let price = itemPriceField.text else { return }
        guard let quantity = itemQuantityField.text else { return }
        persistenceLayer.createNewMarketItem(image: "testTomato", name: name, price: Double(price)!, quantity: Int(quantity)!)
        //        self.presentingViewController?.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
