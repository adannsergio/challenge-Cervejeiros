//
//  BeerDetailViewModel.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import Foundation

struct BeerDetailViewModel {
    let id: Double
    let name: String
    let tagline: String
    let volume: BeerVolume
    let imageURL: URL
    let abv: Double
    let ibu: Double
    let brewerTips: BrewerTip
    let foodPairing: [String]
    let description: String
    
    struct BrewerTip {
        let tip: String
        let author: String
    }
    
    struct BeerVolume {
        let value: Double
        let unit: String
    }
    
    func loadImage(from URL: URL) {}
}
