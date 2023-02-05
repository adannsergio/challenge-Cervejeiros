//
//  BeerListView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 04/02/23.
//

import UIKit

class BeerListView: UIView {
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: collectionViewLayout)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        viewCodeSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BeerListView: ViewCodeProtocol {
    func setViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setConstraints() {
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setAdditionalConfiguration() {
        backgroundColor = .red
        
        collectionView.backgroundColor = .systemGray
    }
}
