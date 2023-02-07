//
//  BeerListPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 05/02/23.
//

import Foundation

protocol BeerListPresenterDelegate: AnyObject {
    func presentBeerList(data: [BeerListData], page: Int)
}

class BeerListPresenter {
    
    weak var delegate: BeerListPresenterDelegate?
    
    var page: Int = 1
    
    public func fetchBeers() {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)&per_page=30") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let sSelf = self else { return }
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                sSelf.page += 1
                sSelf.delegate?.presentBeerList(data: BeerListData.cast(from: beers), page: sSelf.page)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}