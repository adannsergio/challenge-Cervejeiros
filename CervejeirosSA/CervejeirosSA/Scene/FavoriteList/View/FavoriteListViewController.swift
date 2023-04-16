//
//  FavoriteListViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 25/02/23.
//

import UIKit

class FavoriteListViewController: UIViewController {
    // MARK: - Properties
    private let presenter: FavoriteListPresenter
    private let containerView = FavoriteListContainer()
    
    lazy var favoriteListDataSource: FavoriteListCollectionViewDataSource = {
        let dataSource = FavoriteListCollectionViewDataSource(for: containerView.favoriteList)
        return dataSource
    }()

    // MARK: - Initializers
    init(presenter: FavoriteListPresenter = FavoriteListPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.delegate = self
        containerView.favoriteList.delegate = self
        additionalSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.getFavoriteBeers()
    }
    
    override func loadView() {
        self.view = containerView
    }
    
    private func additionalSetup() {
        self.navigationItem.title = "My Favorite Beers"
    }
}

// MARK: - Presenter Delegate
extension FavoriteListViewController: FavoriteListPresenterDelegate {
    func callBeerDetail(injecting beerId: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            
            let beerDetailViewController = BeerDetailViewController(beerId: beerId)
            sSelf.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }
    
    func loadFavorite(beers: [FavoriteViewModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.favoriteListDataSource.appendList(of: beers)
        }
    }
}

// MARK: - CollectionView Delegate
extension FavoriteListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        NSLog("Touch on indexPath.row: %d", indexPath.row)
        
        self.containerView.favoriteList.deselectItem(at: indexPath, animated: true)
        
        let beerSelected = favoriteListDataSource.snapshot.itemIdentifiers(inSection: .main)[indexPath.row]
        
        self.presenter.didSelect(beerSelected)
    }
}
