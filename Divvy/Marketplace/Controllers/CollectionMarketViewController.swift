//
//  CollectionMarketViewController.swift
//  Divvy
//
//  Created by Henry Calderon on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class CollectionMarketViewController: UIViewController {
    //Persistance stuff
    private var persistance = PersistenceLayer()
    
    var marketCollection: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "Categories"),
        CategorySection(),
        TitleSection(title: "Recently Added"),
        RecentSection()
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
        let cartButton = UIBarButtonItem(title: "Cart", style: .plain, target: self, action: #selector(openCart))
        self.navigationItem.rightBarButtonItem = cartButton
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
        marketCollection.register(UINib(nibName: "RecentCell", bundle: .main), forCellWithReuseIdentifier: RecentCell.identifier)
        //MARK: Market Collection Adding
        self.view.addSubview(marketCollection)
        marketCollection.reloadData()
        NSLayoutConstraint.activate([
            marketCollection.topAnchor.constraint(equalTo: view.topAnchor),
            marketCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            marketCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            marketCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //MARK: View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Persistance stuff
        persistance.setNeedsToReloadHabits()
        marketCollection.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        marketCollection.reloadData()
    }
    
    //MARK: Actions
    @objc func openCart(){
        let nextVC = ShoppingCartViewController()
        //The below doesn't work. Need to find best solution here
//        self.navigationController?.popToViewController(nextVC, animated: true)
        self.navigationController?.pushViewController(nextVC, animated: true)
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
