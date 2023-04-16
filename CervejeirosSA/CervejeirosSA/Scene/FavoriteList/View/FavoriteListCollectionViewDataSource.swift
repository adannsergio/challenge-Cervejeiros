//
//  FavoriteListCollectionViewDataSource.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 15/04/23.
//

import UIKit

final class FavoriteListCollectionViewDataSource {
    var diffableDataSource: UICollectionViewDiffableDataSource<FavoriteListCollectionView.Section, FavoriteViewModel>! = nil

    lazy var snapshot: NSDiffableDataSourceSnapshot<FavoriteListCollectionView.Section, FavoriteViewModel> = {
        var diffableDataSource = NSDiffableDataSourceSnapshot<FavoriteListCollectionView.Section, FavoriteViewModel>()
        diffableDataSource.appendSections([.main])
        return diffableDataSource
    }()

    private let beerCellConfigured = UICollectionView.CellRegistration<UICollectionViewListCell,
                                                                       FavoriteViewModel> { (cell, indexPath, item) in
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.text = "\(item.name)"
        cellConfiguration.secondaryText = "\(item.id)"

        cell.contentConfiguration = cellConfiguration
        cell.accessories = [UICellAccessory.disclosureIndicator()]
    }

    required init(for collectionView: UICollectionView) {
        diffableDataSource = UICollectionViewDiffableDataSource<FavoriteListCollectionView.Section,
                                                                FavoriteViewModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: FavoriteViewModel) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: self.beerCellConfigured, for: indexPath, item: identifier)
        }

        // initial empty data
        diffableDataSource.apply(snapshot, animatingDifferences: false)
    }

    func appendList(of beers: [FavoriteViewModel]) {
        restartSnapshot()
        
        snapshot.appendItems(beers)
        
        diffableDataSource.applySnapshotUsingReloadData(snapshot)
    }
    
    private func restartSnapshot() {
        snapshot.deleteAllItems()
        snapshot.appendSections([.main])
    }
}
