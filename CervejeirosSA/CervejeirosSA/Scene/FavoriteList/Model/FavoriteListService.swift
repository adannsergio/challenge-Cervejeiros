//
//  FavoriteListService.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 25/02/23.
//

import Foundation

protocol FavoriteListServiceProtocol {
    var apiClient: APIClientProtocol { get }
    func getBeers(by ids: [Int], completion: @escaping (Result<[Beer], Error>) -> Void)
}
class FavoriteListService: FavoriteListServiceProtocol {
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getBeers(by ids: [Int], completion: @escaping (Result<[Beer], Error>) -> Void) {
        
        let queryIds = ids.map(String.init).joined(separator: "|")
        
        let endpoint = APIClient.Endpoint(path: "beers",
                                          httpMethod: "GET",
                                          queryItens: ["ids": queryIds])
        
        apiClient.request(request: endpoint.urlRequest, completion: completion)
    }
}
