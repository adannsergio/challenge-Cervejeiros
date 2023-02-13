//
//  BeerListViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import UIKit

class BeerDetailViewController: UIViewController {
    private let presenter = BeerDetailPresenter()
    
    init(beerId: Int) {
        super.init(nibName: nil, bundle: nil)
        presenter.delegate = self
        presenter.getBeerDetail(using: beerId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }
}

extension BeerDetailViewController: BeerDetailPresenterDelegate {
    func loadDetails(of beer: BeerDetailViewModel) {
        print(beer)
    }
}
