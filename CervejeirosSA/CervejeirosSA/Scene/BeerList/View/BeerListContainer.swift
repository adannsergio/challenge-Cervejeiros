//
//  BeerListView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 04/02/23.
//

import UIKit

protocol BeerListViewDelegate: AnyObject {
    func fetchNewPageOfbeers()
}

class BeerListContainer: UIView {
    lazy var beerListCollectionView: BeerListCollectionView = {
        let view = BeerListCollectionView()
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

extension BeerListContainer: ViewCodeProtocol {
    func setViewHierarchy() {
        addSubview(beerListCollectionView)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            beerListCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            beerListCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor),
            beerListCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            beerListCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func setAdditionalConfiguration() {}
}
