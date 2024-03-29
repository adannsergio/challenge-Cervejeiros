//
//  ViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 03/02/23.
//

import UIKit

class BeerListViewController: UIViewController {
    // MARK: - Properties
    private let presenter: BeerListPresenter
    private let containerView = BeerListContainer()

    lazy var beerListDataSource: BeerListCollectionViewDataSource = {
        let dataSource = BeerListCollectionViewDataSource(for: containerView.beerListCollectionView)
        return dataSource
    }()

    // MARK: - Initializers
    init(presenter: BeerListPresenter = BeerListPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
        containerView.beerListCollectionView.delegate = self

        additionalSetup()
        presenter.getBeers()
    }

    override func loadView() {
        self.view = containerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = nil
    }

    func additionalSetup() {
        self.navigationItem.title = "Beer List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Presenter Delegate
extension BeerListViewController: BeerListPresenterDelegate {
    func callBeerDetail(injecting beerId: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            
            let beerDetailViewController = BeerDetailViewController(beerId: beerId)
            sSelf.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }

    func newList(of beers: [BeerListViewModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.beerListDataSource.appendList(of: beers)
        }
    }
}

// MARK: - CollectionView Delegate
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
