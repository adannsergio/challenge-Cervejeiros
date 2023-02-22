//
//  CervejeirosSATests.swift
//  CervejeirosSATests
//
//  Created by Adann Sergio Simoes on 22/02/23.
//

import XCTest
@testable import CervejeirosSA

class BeerListServiceTests: XCTestCase {
    
    var service: BeerListService!
    var mockAPIClient: MockAPIClient!
    
    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        service = BeerListService(apiClient: mockAPIClient)
    }
    
    override func tearDown() {
        mockAPIClient = nil
        service = nil
        super.tearDown()
    }
    
    func testFetchBeersSuccess() {
        // Given
        let beersMock = [Beer(id: 1,
                              name: "Beer name",
                              tagline: "Beer tagline",
                              volume: Beer.Volume(value: 2,
                                                  unit: "litres"),
                              image_url: URL(string: "www.example.com"),
                              abv: 3,
                              ibu: 4,
                              ph: 5,
                              brewers_tips: "Brewers tips",
                              contributed_by: "Contributor's name",
                              food_pairing: ["food a", "food b"],
                              description: "Beer's description",
                              ingredients: Beer.Ingredients(malt: [Beer.Malt(name: "malt a"),
                                                                   Beer.Malt(name: "malt b")],
                                                            hops: [Beer.Hops(name: "hop a"),
                                                                   Beer.Hops(name: "hop b")]))]

        let jsonData = beerJsonSample.data(using: .utf8)
        mockAPIClient.data = jsonData
        
        // When
        service.fetchBeers(page: 1) { result in
            // Then
            switch result {
            case .success(let beers):
                XCTAssertEqual(beers[0], beersMock[0])
            case .failure(let error):
                XCTFail("Erro ao buscar cervejas: \(error.localizedDescription)")
            }
        }
    }
    
    func testFetchBeersFailure() {
        // Given
        let expectedError = NSError(domain: "test", code: 123, userInfo: nil)
        mockAPIClient.error = expectedError
        
        var fetchedBeers: [Beer]?
        var fetchError: Error?
        
        // When
        service.fetchBeers(page: 1) { result in
            switch result {
            case .success(let beers):
                fetchedBeers = beers
            case .failure(let error):
                fetchError = error
            }
            
            // Then
            XCTAssertNil(fetchedBeers)
            XCTAssertEqual(fetchError as NSError?, expectedError)
        }
    }
}
