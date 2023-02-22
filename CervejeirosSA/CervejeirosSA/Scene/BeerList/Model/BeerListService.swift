//
//  BeerService.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//

import Foundation

protocol BeerListServiceProtocol {
    var apiClient: APIClientProtocol { get }
    func fetchBeers(page: Int, completion: @escaping (Result<[Beer], Error>) -> Void)
}

class BeerListService: BeerListServiceProtocol {
    var apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) { self.apiClient = apiClient }

    func fetchBeers(page: Int, completion: @escaping (Result<[Beer], Error>) -> Void) {
        let endpoint: APIClient.Endpoint = .init(path: "beers",
                                                 httpMethod: "GET",
                                                 queryItens: ["page": page,
                                                              "per_page": 20])

        apiClient.request(request: endpoint.urlRequest, completion: completion)
    }
}
