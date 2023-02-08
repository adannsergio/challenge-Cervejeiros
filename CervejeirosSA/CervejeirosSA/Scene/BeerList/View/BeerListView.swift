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

class BeerListView: UIView {
    
    enum Section {
        case main
    }
    
    weak var delegate: BeerListViewDelegate?
    
    lazy var snapshot: NSDiffableDataSourceSnapshot<Section, BeerListData> = {
        var diffableDataSource = NSDiffableDataSourceSnapshot<Section, BeerListData>()
        diffableDataSource.appendSections([.main])
        return diffableDataSource
    }()
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: collectionViewLayout)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, BeerListData>! = nil
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        viewCodeSetup()
        
        collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, BeerListData> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item.name)"
            content.secondaryText = "\(item.tagline)"
            cell.contentConfiguration = content
            cell.accessories = [UICellAccessory.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, BeerListData>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: BeerListData) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        // initial empty data
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    func updateList(beers: [BeerListData]) {
        snapshot.appendItems(beers)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension BeerListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        // indexPath starts in zero, so adding one just for convenience
        let nextItem = indexPath.row + 1
        
        let endOfCollectionAvailable = snapshot.numberOfItems
        
        if nextItem == endOfCollectionAvailable { delegate?.fetchNewPageOfbeers() }
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
        configureDataSource()
    }
}
