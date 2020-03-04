//
//  AddItemViewController.swift
//  Divvy
//
//  Created by Bo on 2/11/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - AddItemViewController corresponds to AddItemViewController.xib
 - Should haves:
    [] header:
        [] Start Order title in center
        [] save button on right, brings users to Profile page
 
     [] Tab Bar:
        [] market place page button in center, takes users to market place page
        [] profile button on the right, takes users to profile page
        [] orders button on the left, takes users to current orders page
 
    [] textfield to search for food item
    [] imageview of item
    [] 3 text fields for item details
    [] + button to add people to order
    [] "Post in Marketplace" button, for MVP it will take users to Marketplace Page
*/
import UIKit

class AddItemViewController: UIViewController {
    //Creating and Item
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var itemPriceField: UITextField!
    @IBOutlet weak var itemURLField: UITextField!
    
    //https://codewithchris.com/uipickerview-example/ source reference
    @IBOutlet weak var itemCategoryPicker: UIPickerView!
    @IBOutlet weak var itemAddButton: UIButton!
    
    var pickerCategories: [String] = [String]()
    
    //Nav Bar Stuff
    @IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Connecting data to the item picker thing
        self.itemCategoryPicker.delegate = self
        self.itemCategoryPicker.dataSource = self
        
        pickerCategories = ["Vegetable","Fruit","Meat & Seafood","Grain","Canned","Dairy","Baked Goods","Candy","Chips","Drink","Baby","Pet","Health & Wellness","Personal Care","Household","Other"]
    }
    
    //MARK: IBAction here
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: This will add the item to the marketplace and then dismiss the view
    @IBAction func addItemPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        guard let itemD1 = itemNameField.text else { return }
        guard let itemD2 = itemPriceField.text else { return }
        guard let itemD3 = itemURLField.text else { return }
        persistenceLayer.createNewMarketItem(image: "tomato", itemDetail1: itemD1, itemDetail2: itemD2, itemDetail3: itemD3)
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
//MARK: Extension
extension AddItemViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCategories[row]
    }
    
    
}
