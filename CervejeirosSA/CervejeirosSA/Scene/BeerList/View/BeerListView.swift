//
//  BeerListView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 04/02/23.
//

import UIKit

class BeerListView: UIView {
    
    enum Section {
        case main
    }
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: collectionViewLayout)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        viewCodeSetup()
        collectionView.delegate = self
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item)"
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot, animatingDifferences: false)
        
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

extension BeerListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
}
