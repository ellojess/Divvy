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
    private var persistance = PersistenceLayer()
    
    var marketItems = [MarketItem]()
    //MARK: NAV Top Bar
    @IBOutlet weak var AddItemButton: UIBarButtonItem!
    
    
    //MARK: Table View Items
    @IBOutlet weak var MarketTableView: UITableView!
    
    //MARK: NAV Bar Buttons
    @IBOutlet weak var PreviousOrdersButton: UIBarButtonItem!
    @IBOutlet weak var HomeButton: UIBarButtonItem!
    @IBOutlet weak var ProfileButton: UIBarButtonItem!
    
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
//        Mar.register(
//                    MarketItemViewCell.nib,
//                    forCellReuseIdentifier: MarketItemViewCell.identifier
//        )
        setMarketPlace()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        persistance.setNeedsToReloadHabits()
        MarketTableView.reloadData()
    }

    
    //MARK: Setting Up the Market Place.
    func setMarketPlace(){
//        MarketTableView.register(MarCell.self, forCellReuseIdentifier: PastBoxesCell.identifier)
        MarketTableView.register(UINib(nibName: "MarketItemViewCell", bundle: nil), forCellReuseIdentifier: "MarketCell")
        MarketTableView.delegate = self
        MarketTableView.dataSource = self
    }
    
    func getData(){
        let testBox = MarketItem(image: "testTomato",itemDetail1: "I", itemDetail2: "Need", itemDetail3: "Help")
        marketItems.append(testBox)
    }
    
    
    //MARK: Buttons that link the views all together
    //=======Top=======
    @IBAction func AddItemTapped(_ sender: UIBarButtonItem) {
        let nextVC = AddItemViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
        
//        let addHabitVC = AddHabitViewController.instantiate()
//        let navigationController = UINavigationController(rootViewController: addHabitVC)
//        navigationController.modalPresentationStyle = .fullScreen
//        present(navigationController, animated: true, completion: nil)
    }
    
    
    //=======Bottom========
    @IBAction func OrdersTapped(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func ProfileTapped(_ sender: UIBarButtonItem) {
        let nextVC = ProfileViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

//MARK: Extenstion
extension MarketplaceViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return marketItems.count
        return persistance.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as! MarketItemViewCell
        //        cell.textLabel?.text = "\(indexPath.row) \(testBoxes[indexPath.row].date)"
        let item = persistance.items[indexPath.row]
//        cell.setContents(marketItem:marketItems[indexPath.row])
        cell.setContents(marketItem: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}
