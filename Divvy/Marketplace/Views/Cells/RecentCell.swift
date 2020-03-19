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
        setup()
    }
    
    func setup(){
        itemImage.layer.cornerRadius = 10
    }
}
