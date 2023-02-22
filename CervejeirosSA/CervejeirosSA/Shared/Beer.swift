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
    let ph: Double?
    let brewers_tips: String?
    let contributed_by: String?
    let food_pairing: [String?]?
    let description: String?
    let ingredients: Ingredients?

    struct Volume: Codable {
        let value: Double?
        let unit: String?
    }

    struct Ingredients: Codable {
        let malt: [Malt?]?
        let hops: [Hops?]?
    }

    struct Malt: Codable {
        let name: String?
    }

    struct Hops: Codable {
        let name: String?
    }
}
