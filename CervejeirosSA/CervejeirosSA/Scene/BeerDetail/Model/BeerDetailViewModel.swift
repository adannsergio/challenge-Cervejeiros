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
    
    static func cast(from beer: Beer) -> BeerDetailViewModel {
        return BeerDetailViewModel(id: beer.id!,
                                   name: beer.name!,
                                   tagline: beer.tagline!,
                                   volume: BeerVolume(value: beer.volume!.value! , unit: beer.volume!.unit!),
                                   imageURL: beer.image_url!,
                                   abv: beer.abv!,
                                   ibu: beer.ibu!,
                                   brewerTips: BrewerTip(tip: beer.brewers_tips!, author: beer.contributed_by!),
                                   foodPairing: beer.food_pairing!,
                                   description: beer.description!)
    }
}

