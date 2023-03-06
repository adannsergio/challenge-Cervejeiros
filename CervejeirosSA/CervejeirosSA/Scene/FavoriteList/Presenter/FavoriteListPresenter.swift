//
//  FavoriteListPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 25/02/23.
//

import Foundation

protocol FavoriteListPresenterDelegate: AnyObject {}

class FavoriteListPresenter {
    weak var delegate: FavoriteListPresenterDelegate?
    let service: FavoriteListServiceProtocol
    
    init(service: FavoriteListServiceProtocol = FavoriteListService()) {
        self.service = service
    }
    
    func getFavoriteBeers() {
        service.getBeersByIdsStored { result in
            switch result {
            case .success(let beers):
                for beer in beers {
                    print(beer.name ?? String())
                    print(beer.id ?? String())
                }
            case .failure(let error):
                NSLog("Error fetching beers: %@", error.localizedDescription)
            }
        }
    }
}
