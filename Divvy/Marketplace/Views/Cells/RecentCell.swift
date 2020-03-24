//
//  RecentCell.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class RecentCell: UICollectionViewCell {
    static var identifier: String = "RecentCell"
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setup()
    }
    
    func setup(image: String, name: String, quantity: Int, price: Double){
        itemImage.layer.cornerRadius = 10
        itemImage.image = UIImage(named: image)
        itemNameLabel.text = name
        quantityLabel.text = "Quantity: \(quantity)"
        //Price
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        if let properPrice = formatter.string(from: price as NSNumber){
            priceLabel.text = "\(properPrice)"
        }
        
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
//        let cart = ShoppingCartViewController()
//        cart.testData.append(MarketItems(image: "", name: self.itemNameLabel.text!, price: 0.0, quantity: 0))
        print("recent add pressed")
    }
}
