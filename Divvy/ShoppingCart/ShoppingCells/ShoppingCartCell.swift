//
//  ShoppingCartCell.swift
//  Divvy
//
//  Created by Henry Calderon on 3/18/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class ShoppingCartCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(name: String, image:String, quantity: Int, price: Double){
        itemName.text = name
        itemImage.image = UIImage(named: image)
        quantityLabel.text = "Quantity: \(quantity)"
        priceLabel.text = "$\(price)"
    }
    
}
