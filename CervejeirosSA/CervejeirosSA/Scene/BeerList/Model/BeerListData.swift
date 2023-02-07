//
//  BeerListCellData.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 06/02/23.
//

import Foundation

struct BeerListData: Hashable {
    var id: Int
    var name: String
    var tagline: String
    
    static let sampleData = [
        BeerListData(id: 0, name: "Beer A", tagline: "tagline A"),
        BeerListData(id: 1, name: "Beer B", tagline: "tagline A"),
        BeerListData(id: 2, name: "Beer C", tagline: "tagline A"),
        BeerListData(id: 3, name: "Beer D", tagline: "tagline A"),
        BeerListData(id: 4, name: "Beer E", tagline: "tagline A"),
        BeerListData(id: 5, name: "Beer F", tagline: "tagline A"),
        BeerListData(id: 6, name: "Beer G", tagline: "tagline A"),
        BeerListData(id: 7, name: "Beer H", tagline: "tagline A")
    ]
    
    static func cast(from beers: [Beer]) -> [BeerListData] {
        var beerListData = [BeerListData]()
        
        for beer in beers {
            beerListData.append(BeerListData(id: beer.id ?? Int(),
                                             name: beer.name ?? "Empty Name",
                                             tagline: beer.tagline ?? String()))
        }
        
        return beerListData
    }
}
