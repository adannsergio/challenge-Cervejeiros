//
//  MockAPIClient.swift
//  CervejeirosSATests
//
//  Created by Adann Sergio Simoes on 22/02/23.
//

import Foundation
@testable import CervejeirosSA

class MockAPIClient: APIClientProtocol {
    var error: Error?
    var data: Data?
    
    func request<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let data = data else { return }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
        
        if let error = error {
            completion(.failure(error))
        }
    }
    
    func downloadImageData(request: URLRequest, completion: ((Data?) -> Void)? = nil) {}
}
