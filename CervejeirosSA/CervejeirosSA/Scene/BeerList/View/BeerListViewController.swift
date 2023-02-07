//
//  ViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 03/02/23.
//

import UIKit

class BeerListViewController: UIViewController {
    
    private var beerListView: BeerListView
    
    private let presenter = BeerListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        beerListView.delegate = self
        
        presenter.fetchBeers()
    }
    
    init() {
        self.beerListView = BeerListView()
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = beerListView
    }
    
}

extension BeerListViewController: BeerListPresenterDelegate {
    func presentBeerList(data: [BeerListData], page: Int) {
        DispatchQueue.main.async {
            self.beerListView.updateList(beers: data, from: page)
        }
    }
}

extension BeerListViewController: BeerListViewDelegate {
    func fetchNewPageOfbeers() {
        presenter.fetchBeers()
    }
}
