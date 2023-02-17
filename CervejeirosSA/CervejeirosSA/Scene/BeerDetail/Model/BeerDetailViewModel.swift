//
//  BeerDetailViewModel.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import UIKit

struct BeerDetailViewModel {
    let name: String
    let taglineAndVolume: String
    let imageURL: URL
    let abv: NSAttributedString
    let ibu: NSAttributedString
    let ph: NSAttributedString
    let brewerTip: String?
    let foodPairing: [String]
    let description: String
    let malt: NSAttributedString
    let hops: NSAttributedString
    
    struct BrewerTip {
        let tip: String
        let author: String
    }
    
    struct Volume {
        let value: Double
        let unit: String
    }
    
    func loadImage(from URL: URL) {}

    static func cast(from beer: Beer) -> BeerDetailViewModel {
        
        let name = beer.name ?? String()
        
        let tagline = beer.tagline ?? String()
        let volume = Volume(value: beer.volume?.value ?? Double(), unit: beer.volume?.unit ?? String())
        let tagLineAndVolume = "\(tagline) (\(volume.value) \(volume.unit))"
        
        let imageURL = beer.image_url
        
        let safeAbv = String(beer.abv ?? Double())
        let abv = "ABV: \(safeAbv)".attributedText(text: "ABV:")
        
        let safeIbu = String(beer.ibu ?? Double())
        let ibu = "IBU: \(safeIbu)".attributedText(text: "IBU:")
        
        let safePh = String(beer.ph ?? Double())
        let ph = "PH: \(safePh)".attributedText(text: "PH:")
        
        let brewerTip = BrewerTip(tip: beer.brewers_tips ?? String(), author: beer.contributed_by ?? String())
        let brewerTipString = "\(brewerTip.tip) - \(brewerTip.author)"
        
        let foodPairing = beer.food_pairing?.compactMap({$0}) ?? [String()]
        let description = beer.description ?? String()
        
        var safeMeltsArray = beer.ingredients?.malt?.compactMap({$0?.name}) ?? [String()]
        safeMeltsArray.removeDuplicates()
        let safeMelts = safeMeltsArray.joined(separator: ", ")
        let melts = "Melts: \(safeMelts)".attributedText(text: "Melts:")
        
        var safeHopsArray = beer.ingredients?.hops?.compactMap({$0?.name}) ?? [String()]
        safeHopsArray.removeDuplicates()
        let safeHops = safeHopsArray.joined(separator: ", ")
        let hops = "Hops: \(safeHops)".attributedText(text: "Hops: ")
        
        return BeerDetailViewModel(name: name,
                                   taglineAndVolume: tagLineAndVolume,
                                   imageURL: imageURL ?? URL(string: "https://via.placeholder.com/300.png")!,
                                   abv: abv,
                                   ibu: ibu,
                                   ph: ph,
                                   brewerTip: brewerTipString,
                                   foodPairing: foodPairing,
                                   description: description,
                                   malt: melts,
                                   hops: hops)
    }
}

