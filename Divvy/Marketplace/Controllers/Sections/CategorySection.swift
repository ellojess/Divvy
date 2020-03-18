//
//  CategorySection.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

struct CategorySection: Section{
    var numberOfItems: Int = 6
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.9))
        //========
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //========
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(200))
        //========
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //========
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCell.identifier), for: indexPath) as! CategoryCell
        return cell
    }
    
    
}
