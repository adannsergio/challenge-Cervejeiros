//
//  ViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 03/02/23.
//

import UIKit

class BeerListViewController: UIViewController {
    
    private let presenter = BeerListPresenter()
    
    private let containerView = BeerListContainer()
    
    lazy var beerListDataSource: BeerListCollectionViewDataSource = {
        let dataSource = BeerListCollectionViewDataSource(for: containerView.beerListCollectionView)
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        containerView.beerListCollectionView.delegate = self
        
        presenter.getBeers()
    }
    
    init() {
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
    func pushDetails(of beer: BeerDetailViewModel) {
        // TODO: - Apresentar a tela de detalhes da cerveja selecionada.
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
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        // indexPath starts in zero, so adding one just for convenience
        let nextItemToBeDisplayed = indexPath.row + 1
        
        let endOfCollectionAvailable = beerListDataSource.beerListSnapshot.numberOfItems
        
        if nextItemToBeDisplayed == endOfCollectionAvailable { presenter.getBeers() }
    }
}
