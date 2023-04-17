//
//  APIClient+ClientError.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 20/02/23.
//

import Foundation

extension APIClient {
    enum ClientError: Error {
        case unknownError
        case decodingError
        case invalidURL
    }
}
