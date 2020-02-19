//
//  MarketItemViewCell.swift
//  Divvy
//
//  Created by Henry Calderon on 2/18/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class MarketItemViewCell: UITableViewCell {
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var DetailLableOne: UILabel!
    @IBOutlet weak var DetailLabelTwo: UILabel!
    @IBOutlet weak var DetailLabelThree: UILabel!
    @IBOutlet weak var JoinButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContents(marketItem: MarketItem){
        DetailLableOne.text = marketItem.itemDetail1
         DetailLabelTwo.text = marketItem.itemDetail2
         DetailLabelThree.text = marketItem.itemDetail3

    }
    
}
