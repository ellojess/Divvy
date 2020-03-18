//
//  TitleCell.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(title: String) {
        titleLabel.text = title
    }

}
