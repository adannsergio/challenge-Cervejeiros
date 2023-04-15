//
//  BeerDetailService.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//

import Foundation

protocol BeerDetailServiceProtocol {
    func fetchDetail(of beerId: Int, completion: @escaping (Result<[Beer], Error>) -> Void)
    func downloadImage(from imageUrl: URL, completion: ((Data?) -> Void)?)
    func isBeerIdentifierStored(beerId: Int) -> Bool
    func removeBeerIdentifierFromDefaultStorage(beerId: Int)
    func addBeerIdentifierToDefaultStorage(beerId: Int)
}

class BeerDetailService: BeerDetailServiceProtocol {
    private var apiClient: APIClientProtocol
    private var defaultStorage: DefaultStorageProtocol

    init(apiClient: APIClientProtocol = APIClient(),
         defaultStorage: DefaultStorage = DefaultStorage()) {
        self.apiClient = apiClient
        self.defaultStorage = defaultStorage
    }

    func fetchDetail(of beerId: Int, completion: @escaping (Result<[Beer], Error>) -> Void) {
        let endpoint: APIClient.Endpoint = .init(path: "beers/\(beerId)",
                                                 httpMethod: "GET",
                                                 queryItens: nil)
        do {
            try apiClient.request(request: endpoint.asURLRequest(), completion: completion)
        } catch {
            completion(.failure(error))
        }
        
    }

    func downloadImage(from imageUrl: URL, completion: ((Data?) -> Void)? = nil) {
        let endpoint: APIClient.Endpoint = .init(baseUrl: imageUrl,
                                                 path: String(),
                                                 httpMethod: "GET",
                                                 queryItens: nil)
        do {
            try apiClient.downloadImageData(request: endpoint.asURLRequest(), completion: completion)
        } catch {
            completion?(nil)
        }

    }
    
    func isBeerIdentifierStored(beerId: Int) -> Bool {
        defaultStorage.contains(value: beerId, for: .beerID)
    }
    
    func removeBeerIdentifierFromDefaultStorage(beerId: Int) {
        defaultStorage.remove(value: beerId, for: .beerID)
    }
    
    func addBeerIdentifierToDefaultStorage(beerId: Int) {
        defaultStorage.append(value: beerId, for: .beerID)
    }
    
}
