//
//  BeerListCollectionViewDataSource.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import Foundation
import UIKit

final class BeerListCollectionViewDataSource {
    var beerListDataSource: UICollectionViewDiffableDataSource<BeerListCollectionView.Section, BeerListViewModel>! = nil
    
    lazy var beerListSnapshot: NSDiffableDataSourceSnapshot<BeerListCollectionView.Section, BeerListViewModel> = {
        var diffableDataSource = NSDiffableDataSourceSnapshot<BeerListCollectionView.Section, BeerListViewModel>()
        diffableDataSource.appendSections([.main])
        return diffableDataSource
    }()
    
    private let beerCellConfigured = UICollectionView.CellRegistration<UICollectionViewListCell, BeerListViewModel> { (cell, indexPath, item) in
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.text = "\(item.name)"
        cellConfiguration.secondaryText = "\(item.tagline)"
        
        cell.contentConfiguration = cellConfiguration
        cell.accessories = [UICellAccessory.disclosureIndicator()]
    }
    
    required init(for collectionView: UICollectionView) {
        beerListDataSource = UICollectionViewDiffableDataSource<BeerListCollectionView.Section, BeerListViewModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: BeerListViewModel) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: self.beerCellConfigured, for: indexPath, item: identifier)
        }
        
        // initial empty data
        beerListDataSource.apply(beerListSnapshot, animatingDifferences: false)
    }
    
    func appendList(of beers: [BeerListViewModel]) {
        beerListSnapshot.appendItems(beers)
        beerListDataSource.apply(beerListSnapshot, animatingDifferences: true)
    }
}
