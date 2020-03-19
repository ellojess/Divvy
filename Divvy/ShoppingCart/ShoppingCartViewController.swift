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
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCart()
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTable.reloadData()
    }

    //MARK: Setup of the cart happens here
    func setupCart(){
        cartTable.register(UINib(nibName: "ShoppingCartCell", bundle: nil), forCellReuseIdentifier: "ShoppingCartCell")
        cartTable.dataSource = self
        cartTable.delegate = self
    }
    @IBAction func checkoutPressed(_ sender: UIButton) {
        print("Checkout pressed")
    }
}

//MARK: Extension
extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell", for: indexPath) as! ShoppingCartCell
//        cell.setup(name: <#T##String#>, image: <#T##String#>, quantity: <#T##Int#>, price: <#T##Double#>)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}
