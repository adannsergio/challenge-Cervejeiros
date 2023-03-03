//
//  BeerDetailService.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//

import Foundation

protocol BeerDetailServiceProtocol {
    var apiClient: APIClientProtocol { get }
    var defaultStorage: DefaultStorage { get }
    func fetchDetail(of beerId: Int, completion: @escaping (Result<[Beer], Error>) -> Void)
    func downloadImage(from imageUrl: URL, completion: ((Data?) -> Void)?)
    func checkIfBeerIdentifierIsStored(beerId: Int, completion: @escaping (Result<Bool, Error>) -> Void)
    func removeBeerIdentifierFromDefaultStorage(beerId: Int)
    func addBeerIdentifierToDefaultStorage(beerId: Int)
}

class BeerDetailService: BeerDetailServiceProtocol {
    var apiClient: APIClientProtocol
    var defaultStorage: DefaultStorage

    init(apiClient: APIClientProtocol = APIClient(),
         defaultStorage: DefaultStorage = DefaultStorage()) {
        self.apiClient = apiClient
        self.defaultStorage = defaultStorage
    }

    func fetchDetail(of beerId: Int, completion: @escaping (Result<[Beer], Error>) -> Void) {
        let endpoint: APIClient.Endpoint = .init(path: "beers/\(beerId)",
                                                 httpMethod: "GET",
                                                 queryItens: nil)

        apiClient.request(request: endpoint.urlRequest, completion: completion)
    }

    func downloadImage(from imageUrl: URL, completion: ((Data?) -> Void)? = nil) {
        let endpoint: APIClient.Endpoint = .init(baseUrl: imageUrl,
                                                 path: String(),
                                                 httpMethod: "GET",
                                                 queryItens: nil)

        apiClient.downloadImageData(request: endpoint.urlRequest, completion: completion)
    }
    
    func checkIfBeerIdentifierIsStored(beerId: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        // TODO: - Implementar função para que a tela de detalhes permita desfavoritar um item
    }
    
    func removeBeerIdentifierFromDefaultStorage(beerId: Int) {
        // TODO: - Implementar função para que uma cerveja seja removida da lista de favoritos
    }
    
    func addBeerIdentifierToDefaultStorage(beerId: Int) {
        // TODO: - Implementar função para que uma cerveja seja adicionada na lista de favoritos
    }
    
}
