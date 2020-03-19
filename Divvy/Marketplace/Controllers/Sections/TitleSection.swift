//
//  TitleSection.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

struct TitleSection: Section {
    
    let numberOfItems = 1
    let title: String
    init (title: String) {
        self.title = title
    }
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    //Step 6
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TitleCell.self), for: indexPath) as! TitleCell
        cell.set(title: title)
        return cell
    }
}
