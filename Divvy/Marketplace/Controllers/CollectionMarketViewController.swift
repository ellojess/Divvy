//
//  CollectionMarketViewController.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class CollectionMarketViewController: UIViewController {
    
    var marketCollection: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "Categories"),
        CategorySection(),
        TitleSection(title: "Recently Added")
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var section = self.sections
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return self.sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Marketplace"
        self.view.backgroundColor = UIColor.white
        setupCollectionView()
    }
    
    func setupCollectionView(){
        marketCollection = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        marketCollection.delegate = self
        marketCollection.dataSource = self
        marketCollection.backgroundColor = UIColor.white
        //MARK: Register the cells
        marketCollection.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        marketCollection.register(UINib(nibName: "CategoryCell", bundle: .main), forCellWithReuseIdentifier: CategoryCell.identifier)
        //MARK: Market Collection Adding
        self.view.addSubview(marketCollection)
        marketCollection.reloadData()
    }
    
    //MARK: View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        marketCollection.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        marketCollection.reloadData()
    }
}

extension CollectionMarketViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: marketCollection, indexPath: indexPath)
    }
    
    
}
