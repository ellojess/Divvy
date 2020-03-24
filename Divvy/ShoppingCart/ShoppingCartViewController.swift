//
//  ShoppingCartViewController.swift
//  Divvy
//
//  Created by Henry Calderon on 3/18/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var testData: [MarketItems] = [
        MarketItems(image: "testTomato", name: "Tomato", price: 0.50, quantity: 1),
        MarketItems(image: "testTomato", name: "Tomatos", price: 1.00, quantity: 2)
    ]
    
    var totalPrice: Double = 0.00
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
//        cartTable.reloadData()
//        totalPriceLabel.text = "$\(totalPrice)"
        setupCart()
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        totalPriceLabel.text = "$\(totalPrice)"
        cartTable.reloadData()
    }

    //MARK: Setup of the cart happens here
    func setupCart(){
        cartTable.register(UINib(nibName: "ShoppingCartCell", bundle: nil), forCellReuseIdentifier: "ShoppingCartCell")
        cartTable.dataSource = self
        cartTable.delegate = self
        for item in testData{
            totalPrice += item.price
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        if let properTotal = formatter.string(from: totalPrice as NSNumber){
            totalPriceLabel.text = "$\(totalPrice)"
        }
    }
    @IBAction func checkoutPressed(_ sender: UIButton) {
        print("Checkout pressed")
    }
}

//MARK: Extension
extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell", for: indexPath) as! ShoppingCartCell
        let item = testData[indexPath.row]
        cell.setup(name: item.name, image: item.image, quantity: item.quantity, price: item.price)
//        totalPrice = totalPrice + testData[indexPath.row].price
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}
