//
//  BeerListPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 05/02/23.
//

import UIKit

protocol BeerListPresenterDelegate: AnyObject {
    func newList(of beers: [BeerListViewModel])
    func callBeerDetail(injeting beerId: Int)
}

class BeerListPresenter {
    
    weak var delegate: BeerListPresenterDelegate?
    let service: BeerListService

    private var currentPage: Int = 1

    init(service: BeerListService = BeerListService()) {
        self.service = service
    }

    func didSelect(_ beer: BeerListViewModel) {
        delegate?.callBeerDetail(injeting: Int(beer.id))
    }

    func getBeers() {
        service.fetchBeers(page: currentPage) { [weak self] result in
            guard let sSelf = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let beers):
                    let beersViewModel = BeerListViewModel.cast(from: beers)
                    sSelf.delegate?.newList(of: beersViewModel)
                    sSelf.currentPage += 1
                case .failure(let error):
                    NSLog("Error fetching beers: %@", error.localizedDescription)
                }
            }
        }
    }
}
