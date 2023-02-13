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
    
    private var currentPage: Int = 1
    
    func didSelect(_ beer: BeerListViewModel) {
        delegate?.callBeerDetail(injeting: Int(beer.id))
    }
    
    public func getBeers() {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(currentPage)&per_page=30") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let sSelf = self else { return }
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                sSelf.currentPage += 1
                sSelf.delegate?.newList(of: BeerListViewModel.cast(from: beers))
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}

