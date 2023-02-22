//
//  BeerListCollectionViewDataSource.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import UIKit

final class BeerListCollectionViewDataSource {
    var diffableDataSource: UICollectionViewDiffableDataSource<BeerListCollectionView.Section, BeerListViewModel>! = nil

    lazy var snapshot: NSDiffableDataSourceSnapshot<BeerListCollectionView.Section, BeerListViewModel> = {
        var diffableDataSource = NSDiffableDataSourceSnapshot<BeerListCollectionView.Section, BeerListViewModel>()
        diffableDataSource.appendSections([.main])
        return diffableDataSource
    }()

    private let beerCellConfigured = UICollectionView.CellRegistration<UICollectionViewListCell,
                                                                        BeerListViewModel> { (cell, indexPath, item) in
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.text = "\(item.name)"
        cellConfiguration.secondaryText = "\(item.tagline)"

        cell.contentConfiguration = cellConfiguration
        cell.accessories = [UICellAccessory.disclosureIndicator()]
    }

    required init(for collectionView: UICollectionView) {
        diffableDataSource = UICollectionViewDiffableDataSource<BeerListCollectionView.Section,
                                                                    BeerListViewModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: BeerListViewModel) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: self.beerCellConfigured, for: indexPath, item: identifier)
        }

        // initial empty data
        diffableDataSource.apply(snapshot, animatingDifferences: false)
    }

    func appendList(of beers: [BeerListViewModel]) {
        snapshot.appendItems(beers)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }
}
