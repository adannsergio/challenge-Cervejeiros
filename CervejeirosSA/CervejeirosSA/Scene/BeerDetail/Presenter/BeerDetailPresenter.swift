//
//  BeerDetailPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 12/02/23.
//

import Foundation

protocol BeerDetailPresenterDelegate: AnyObject {
    func loadDetails(of beer: BeerDetailViewModel)
    func configureSaveButton()
    func configureDeleteButton()
}

class BeerDetailPresenter {
    // MARK: - Properties
    weak var delegate: BeerDetailPresenterDelegate?
    private let service: BeerDetailServiceProtocol
    private let beerId: Int
    private let isBeerSaved: Bool

    // MARK: - Initializers
    init(service: BeerDetailService = BeerDetailService(), beerId: Int) {
        self.service = service
        self.beerId = beerId
        self.isBeerSaved = service.isBeerIdentifierStored(beerId: beerId)
    }

    // MARK: - Public Methodes
    public func getBeerDetail() {
        let group = DispatchGroup()

        var beer: Beer?
        var imageData: Data?

        group.enter()
        service.fetchDetail(of: beerId) { [weak self] result in
            guard let sSelf = self else { group.leave(); return }

            switch result {
            case .success(let beerResult):
                
                beer = beerResult.first
                
                guard let safeImageUrl = beerResult.first?.image_url else {
                    group.leave()
                    return
                }

                sSelf.service.downloadImage(from: safeImageUrl) { imageDataDownloaded in
                    imageData = imageDataDownloaded
                    group.leave()
                }

            case .failure(let error):
                NSLog("Error fetching detail of a beer: %@", error.localizedDescription)
                group.leave()
            }
        }

        group.notify(queue: .main) { [weak self] in
            guard let sSelf = self,
                  let beer = beer else { return }

            let beerDetailViewModel = BeerDetailViewModel.cast(from: beer,
                                                               considering: imageData)

            sSelf.delegate?.loadDetails(of: beerDetailViewModel)

            sSelf.isBeerSaved ? sSelf.delegate?.configureDeleteButton() : sSelf.delegate?.configureSaveButton()
        }
    }

    public func saveBeer() {
        service.storeBeerIdentifier(beerId: beerId)
    }

    public func deleteBeer() {
        service.removeBeerIdentifierStored(beerId: beerId)
    }
}
