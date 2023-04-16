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
        let insetGroupedLayout = UICollectionLayoutListConfiguration(appearance:  .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: insetGroupedLayout)

        self.collectionViewLayout = listLayout
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
