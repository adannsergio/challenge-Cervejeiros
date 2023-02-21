//
//  BeerDetailService.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//

import Foundation


protocol BeerDetailProtocol {
    func fetchDetail(of beerId: Int, completion: @escaping (Result<[Beer], Error>) -> Void)
    func downloadImage(from imageUrl: URL, completion: ((Data?) -> Void)?)
}

class BeerDetailService: BeerDetailProtocol {
    let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
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
}
