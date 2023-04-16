//
//  FavoriteListPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 25/02/23.
//

import Foundation

protocol FavoriteListPresenterDelegate: AnyObject {
    func loadFavorite(beers: [FavoriteViewModel])
}

class FavoriteListPresenter {
    weak var delegate: FavoriteListPresenterDelegate?
    let service: FavoriteListServiceProtocol

    init(service: FavoriteListServiceProtocol = FavoriteListService()) {
        self.service = service
    }

    func getFavoriteBeers() {
        service.getBeersByIdsStored { [weak self] result in
            guard let sSelf = self else { return }
            
            switch result {
            case .success(let beers):
                let favoriteViewModel = FavoriteViewModel.cast(from: beers)
                sSelf.delegate?.loadFavorite(beers: favoriteViewModel)
            case .failure(let error):
                NSLog("Error fetching beers: %@", error.localizedDescription)
            }
        }
    }
}
