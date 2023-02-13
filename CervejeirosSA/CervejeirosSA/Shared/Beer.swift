//
//  Beer.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 05/02/23.
//

import Foundation

struct Beer: Codable {
    let id: Double?
    let name: String?
    let tagline: String?
    let volume: Volume?
    let image_url: URL?
    let abv: Double?
    let ibu: Double?
    let brewers_tips: String?
    let contributed_by: String?
    let food_pairing: [String]?
    let description: String?
    
    struct Volume: Codable {
        let value: Double?
        let unit: String?
    }
}
