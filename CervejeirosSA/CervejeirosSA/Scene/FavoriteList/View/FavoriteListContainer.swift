//
//  FavoriteListContainer.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 15/04/23.
//

import UIKit

class FavoriteListContainer: UIView {

    lazy var favoriteList: FavoriteListCollectionView = {
        let view = FavoriteListCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
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

extension FavoriteListContainer: ViewCodeProtocol {
    func setViewHierarchy() {
        addSubview(favoriteList)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            favoriteList.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            favoriteList.topAnchor.constraint(equalTo: self.topAnchor),
            favoriteList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            favoriteList.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setAdditionalConfiguration() {}
}
