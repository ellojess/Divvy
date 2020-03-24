//
//  RecentSection.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

struct RecentSection: Section{
    private var persistence = PersistenceLayer()
//    var numberOfItems: Int = PersistenceLayer().items.count
    var numberOfItems: Int = 6
    
    let testData: [MarketItems] = [
        MarketItems(image: "testTomato", name: "tomato", price: 0.50, quantity: 1),
        MarketItems(image: "testTomato", name: "tomatos", price: 1.50, quantity: 3),
        MarketItems(image: "testTomato", name: "tomatos3", price: 1.00, quantity: 2),
        MarketItems(image: "testTomato", name: "tomatos4", price: 2.00, quantity: 4),
        MarketItems(image: "testTomato", name: "tomatos5", price: 1.00, quantity: 2),
        MarketItems(image: "testTomato", name: "tomatos6", price: 5.00, quantity: 10),
    ]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RecentCell.identifier), for: indexPath) as! RecentCell
//        let item = persistence.items[indexPath.row]
        let item = testData[indexPath.row]
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = Locale.current
        cell.setup(image: item.image, name: item.name, quantity: item.quantity, price: item.price)
        return cell
    }
    
    
}
