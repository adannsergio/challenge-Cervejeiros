//
//  BeerDetailPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 12/02/23.
//

import Foundation

protocol BeerDetailPresenterDelegate: AnyObject {
    func loadDetails(of beer: BeerDetailViewModel)
}

class BeerDetailPresenter {
    weak var delegate: BeerDetailPresenterDelegate?
    private let service: BeerDetailService
    private let beerId: Int
    private let defaultStorage: DefaultStorage

    init(service: BeerDetailService = BeerDetailService(), beerId: Int) {
        self.service = service
        self.beerId = beerId
        self.defaultStorage = DefaultStorage()
    }

    deinit {
        delegate = nil
    }

    public func getBeerDetail() {
        service.fetchDetail(of: beerId) { [weak self] result in
            guard let sSelf = self else { return }

            switch result {
            case .success(let beer):
                guard let firstSafeBeer = beer.first else { return }
                guard let safeImageUrl = firstSafeBeer.image_url else { return }

                sSelf.service.downloadImage(from: safeImageUrl) { imageData in
                    guard let safeImageData = imageData else { return }

                    let beerDetailViewModel = BeerDetailViewModel.cast(from: firstSafeBeer, considering: safeImageData)

                    sSelf.delegate?.loadDetails(of: beerDetailViewModel)
                }

            case .failure(let error):
                NSLog("Error fetching detail of a beer: %@", error.localizedDescription)
            }
        }
    }
    
    public func getSavedBeers() -> [Int]? {
        let beers = defaultStorage.get(from: .beerID) as [Int]?
        return beers
    }
    
    public func saveBeer() {
        defaultStorage.append(value: beerId, for: .beerID)
    }

}
