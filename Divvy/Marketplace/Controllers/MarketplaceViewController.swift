//
//  MarketplaceViewController.swift
//  Divvy
//
//  Created by Bo on 2/11/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//
/*
 - MarketplaceViewController corresponds to MarketplaceViewController.xib
 - Should haves:
    [] header:
        [] marketplace label title in center
        [] + button on right, brings users to Add Item Page
     [] Tab Bar:
          [] market place page button in center, takes users to market place page
          [] profile button on the right, takes users to profile page
          [] orders button on the left, takes users to current orders page
    [] textfield to search for food item
    [] collection views
        [] organized by department (Fruits, Vegetables, Pets, Household, Meat, ect)
        [] scroll horizonally, populated with user postings from Add Item Page
*/
import UIKit

class MarketplaceViewController: UIViewController {
    
    //MARK: Table View Items
    @IBOutlet weak var MarketTableView: UITableView!
    @IBOutlet var MarketItemCell: UITableViewCell!
        //Table View Cell Items
        @IBOutlet weak var ItemCellView: UIImageView!
        @IBOutlet weak var ItemDetailOneLabel: UILabel!
        @IBOutlet weak var ItemDetailTwoLabel: UILabel!
        @IBOutlet weak var ItemDetailThreeLabel: UILabel!
    
    
    //MARK: NAV Bar Buttons
    @IBOutlet weak var PreviousOrdersButton: UIBarButtonItem!
    @IBOutlet weak var HomeButton: UIBarButtonItem!
    @IBOutlet weak var ProfileButton: UIBarButtonItem!
    
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        MarketTableView.register(UINib(nibName: "MarketItemCell", bundle: nil), forCellReuseIdentifier: "MarketItemCell")
//        self.navigationController?.initRootViewController(vc: self)
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func OrdersTapped(_ sender: UIBarButtonItem) {
    }
    @IBAction func ProfileTapped(_ sender: UIBarButtonItem) {
        let nextVC = ProfileViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
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
