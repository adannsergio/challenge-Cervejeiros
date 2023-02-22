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
    let service: BeerDetailService

    init(service: BeerDetailService = BeerDetailService()) {
        self.service = service
    }

    deinit {
        delegate = nil
    }

    public func getBeerDetail(using id: Int) {
        service.fetchDetail(of: id) { [weak self] result in
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
}
