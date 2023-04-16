//
//  FavoriteViewModel.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 15/04/23.
//

import Foundation

struct FavoriteViewModel: Hashable {
    var id: Double
    var name: String
    var imageURL: URL?

    static let sampleData = [
        FavoriteViewModel(id: 0, name: "Beer A", imageURL: nil),
        FavoriteViewModel(id: 1, name: "Beer B", imageURL: nil),
        FavoriteViewModel(id: 2, name: "Beer C", imageURL: nil),
        FavoriteViewModel(id: 3, name: "Beer D", imageURL: nil),
        FavoriteViewModel(id: 4, name: "Beer E", imageURL: nil),
        FavoriteViewModel(id: 5, name: "Beer F", imageURL: nil),
        FavoriteViewModel(id: 6, name: "Beer G", imageURL: nil),
        FavoriteViewModel(id: 7, name: "Beer H", imageURL: nil)
    ]

    static func cast(from beers: [Beer]) -> [FavoriteViewModel] {
        var beerListData = [FavoriteViewModel]()

        for beer in beers {
            beerListData.append(
                FavoriteViewModel(id: beer.id ?? Double(),
                                  name: beer.name ?? "Empty Name",
                                  imageURL: beer.image_url))
        }

        return beerListData
    }
}
