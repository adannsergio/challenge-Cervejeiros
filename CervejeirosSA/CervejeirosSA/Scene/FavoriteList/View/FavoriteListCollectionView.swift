//
//  FavoriteListCollectionView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 15/04/23.
//

import UIKit

class FavoriteListCollectionView: UICollectionView {
    enum Section {
        case main
    }

    convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        setupLayout()
    }

    internal func setupLayout() {
        let layout = UICollectionViewCompositionalLayout { section, layoutEnvironment in
            let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            let layoutSection =  NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
            layoutSection.interGroupSpacing = 20
            return layoutSection
        }

        collectionViewLayout = layout

        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
