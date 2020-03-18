//
//  CategoryCell.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static var identifier: String = "CategoryCell"
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        categoryImage.layer.cornerRadius = 5
    }

}
