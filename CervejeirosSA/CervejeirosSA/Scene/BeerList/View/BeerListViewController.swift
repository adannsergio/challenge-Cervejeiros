//
//  ViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 03/02/23.
//

import UIKit

class BeerListViewController: UIViewController {
    
    private let presenter: BeerListPresenter
    
    private let containerView = BeerListContainer()
    
    lazy var beerListDataSource: BeerListCollectionViewDataSource = {
        let dataSource = BeerListCollectionViewDataSource(for: containerView.beerListCollectionView)
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        containerView.beerListCollectionView.delegate = self
        
        additionalSetup()
        presenter.getBeers()
    }
    
    func additionalSetup() {
        // TODO: - Criar um sistema de strings globais
        self.navigationItem.title = "Beer List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    init(presenter: BeerListPresenter = BeerListPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = containerView
    }
    
}

extension BeerListViewController: BeerListPresenterDelegate {
    func callBeerDetail(injeting beerId: Int) {
        DispatchQueue.main.async {
            let vc = BeerDetailViewController(beerId: beerId)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func newList(of beers: [BeerListViewModel]) {
        DispatchQueue.main.async {
            self.beerListDataSource.appendList(of: beers)
        }
    }
}

extension BeerListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        self.containerView.beerListCollectionView.deselectItem(at: indexPath, animated: true)
        
        let beerSelected = beerListDataSource.snapshot.itemIdentifiers(inSection: .main)[indexPath.row]
        
        self.presenter.didSelect(beerSelected)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        let nextItemToBeDisplayed = indexPath.row
        let endOfCollectionAvailable = beerListDataSource.snapshot.numberOfItems
        
        // Removing one just to match indexPath and numberOfItems begins
        if nextItemToBeDisplayed == endOfCollectionAvailable - 1 { presenter.getBeers() }
    }
}
