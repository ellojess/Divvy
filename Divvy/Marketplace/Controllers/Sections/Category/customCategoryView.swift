//
//  customCategoryView.swift
//  Divvy
//
//  Created by Henry Calderon on 3/22/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class customCategoryView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.size
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

}
