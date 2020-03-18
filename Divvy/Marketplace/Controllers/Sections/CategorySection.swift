//
//  CategorySection.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

struct CategorySection: Section{
/*    Categories: Cleaning; snacks; Beverages; Baby & Kids; Health & Beauty;
     Paper Products; Candy, Gum, and Mints; Canned & Packaged
     Specific ones: Berkley Jensen, Wellsley Farms
     
 */
    let categories: [CategoryItems] = [
        CategoryItems(image: "wash", categoryName: "Cleaning"),
        CategoryItems(image: "popcorn", categoryName: "Snacks")
    ]
    var numberOfItems: Int = 2
    
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
        cell.categoryImage.image = UIImage(named: categories[indexPath.row].image)
        cell.categoryLabel.text = categories[indexPath.row].categoryName
        return cell
    }
    
    
}
//MARK: Attributions

/*
 --Cleaning--
 Icons made by <a href="https://www.flaticon.com/authors/monkik" title="monkik">monkik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
 --Snacks--
 Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
 */
