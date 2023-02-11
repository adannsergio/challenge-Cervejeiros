//
//  BeerListCollectionView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import Foundation
import UIKit

class BeerListCollectionView: UICollectionView {
    
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
