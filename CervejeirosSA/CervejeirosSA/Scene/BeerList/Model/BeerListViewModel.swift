//
//  BeerListCellData.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 06/02/23.
//

import Foundation

struct BeerListViewModel: Hashable {
    var id: Int
    var name: String
    var tagline: String
    
    static let sampleData = [
        BeerListViewModel(id: 0, name: "Beer A", tagline: "tagline A"),
        BeerListViewModel(id: 1, name: "Beer B", tagline: "tagline A"),
        BeerListViewModel(id: 2, name: "Beer C", tagline: "tagline A"),
        BeerListViewModel(id: 3, name: "Beer D", tagline: "tagline A"),
        BeerListViewModel(id: 4, name: "Beer E", tagline: "tagline A"),
        BeerListViewModel(id: 5, name: "Beer F", tagline: "tagline A"),
        BeerListViewModel(id: 6, name: "Beer G", tagline: "tagline A"),
        BeerListViewModel(id: 7, name: "Beer H", tagline: "tagline A")
    ]
    
    static func cast(from beers: [Beer]) -> [BeerListViewModel] {
        var beerListData = [BeerListViewModel]()
        
        for beer in beers {
            beerListData.append(BeerListViewModel(id: beer.id ?? Int(),
                                             name: beer.name ?? "Empty Name",
                                             tagline: beer.tagline ?? String()))
        }
        
        return beerListData
    }
}
