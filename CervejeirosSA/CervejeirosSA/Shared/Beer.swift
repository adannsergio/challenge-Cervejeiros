//
//  Beer.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 05/02/23.
//

import Foundation

struct Beer: Codable {
    let id: Int?
    let name: String?
    let tagline: String?
    let abv: Double?
    let ibu: Double?
    let description: String?
    let foodPairing: [String]?
    let brewerTips: String?
    let image_url: URL?
}
