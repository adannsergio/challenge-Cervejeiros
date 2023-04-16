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
    var imageData: Data?

    static let sampleData = [
        FavoriteViewModel(id: 0, name: "Beer A", imageData: Data()),
        FavoriteViewModel(id: 1, name: "Beer B", imageData: Data()),
        FavoriteViewModel(id: 2, name: "Beer C", imageData: Data()),
        FavoriteViewModel(id: 3, name: "Beer D", imageData: Data()),
        FavoriteViewModel(id: 4, name: "Beer E", imageData: Data()),
        FavoriteViewModel(id: 5, name: "Beer F", imageData: Data()),
        FavoriteViewModel(id: 6, name: "Beer G", imageData: Data()),
        FavoriteViewModel(id: 7, name: "Beer H", imageData: Data())
    ]

    static func cast(from beers: [Beer]) -> [FavoriteViewModel] {
        var beerListData = [FavoriteViewModel]()

        for beer in beers {
            beerListData.append(
                FavoriteViewModel(id: beer.id ?? Double(),
                                  name: beer.name ?? "Empty Name",
                                  imageData: Data()))
        }

        return beerListData
    }
}
