//
//  FavoriteViewModel.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 15/04/23.
//

import Foundation

struct FavoriteViewModel: Hashable {
    var beerId: Double
    var name: String
    var imageURL: URL?

    static let sampleData = [
        FavoriteViewModel(beerId: 0, name: "Beer A", imageURL: nil),
        FavoriteViewModel(beerId: 1, name: "Beer B", imageURL: nil),
        FavoriteViewModel(beerId: 2, name: "Beer C", imageURL: nil),
        FavoriteViewModel(beerId: 3, name: "Beer D", imageURL: nil),
        FavoriteViewModel(beerId: 4, name: "Beer E", imageURL: nil),
        FavoriteViewModel(beerId: 5, name: "Beer F", imageURL: nil),
        FavoriteViewModel(beerId: 6, name: "Beer G", imageURL: nil),
        FavoriteViewModel(beerId: 7, name: "Beer H", imageURL: nil)
    ]

    static func cast(from beers: [Beer]) -> [FavoriteViewModel] {
        var beerListData = [FavoriteViewModel]()

        for beer in beers {
            beerListData.append(
                FavoriteViewModel(beerId: beer.id ?? Double(),
                                  name: beer.name ?? "Empty Name",
                                  imageURL: beer.image_url))
        }

        return beerListData
    }
}
