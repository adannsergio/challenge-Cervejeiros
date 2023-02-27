//
//  FavoriteListService.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 25/02/23.
//

import Foundation

protocol FavoriteListServiceProtocol {
    var apiClient: APIClientProtocol { get }
    var defaultStorage: DefaultStorage { get }
    func getBeersByIdsStored(completion: @escaping (Result<[Beer], Error>) -> Void)
}
class FavoriteListService: FavoriteListServiceProtocol {
    var apiClient: APIClientProtocol
    var defaultStorage: DefaultStorage
    
    init(apiClient: APIClientProtocol = APIClient(), defaultStorage: DefaultStorage = DefaultStorage()) {
        self.defaultStorage = defaultStorage
        self.apiClient = apiClient
    }
    
    func getBeersByIdsStored(completion: @escaping (Result<[Beer], Error>) -> Void) {
        guard let beersIds = defaultStorage.get(from: .beerID) as [Int]? else { return }
        
        let queryIds = beersIds.map(String.init).joined(separator: "|")
        
        let endpoint = APIClient.Endpoint(path: "beers",
                                          httpMethod: "GET",
                                          queryItens: ["ids": queryIds])
        
        apiClient.request(request: endpoint.urlRequest, completion: completion)
    }
}
