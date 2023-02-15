//
//  BeerDetailPresenter.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 12/02/23.
//

import Foundation

protocol BeerDetailPresenterDelegate: NSObject {
    func loadDetails(of beer: BeerDetailViewModel)
}

class BeerDetailPresenter {
    weak var delegate: BeerDetailPresenterDelegate?
 
    public func getBeerDetail(using id: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers/\(String(id))") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let sSelf = self else { return }
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let unsafeBeer = try JSONDecoder().decode([Beer].self, from: data).first
                // TODO: - Fazer trativa para retornar erro caso beer seja nil
                sSelf.delegate?.loadDetails(of: BeerDetailViewModel.cast(from: unsafeBeer!))
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    deinit {
        delegate = nil
    }
}
