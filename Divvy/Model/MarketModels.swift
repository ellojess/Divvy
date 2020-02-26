//
//  MarketModels.swift
//  Divvy
//
//  Created by Henry Calderon on 2/18/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

struct MarketItem: Codable {
    let image: String
    let itemDetail1: String
    let itemDetail2: String
    let itemDetail3: String
    
    var imagess: UIImage {
        guard let image = UIImage(named: String(describing: self)) else {
            fatalError("image \(self) not found")
        }

        return image
    }
}
