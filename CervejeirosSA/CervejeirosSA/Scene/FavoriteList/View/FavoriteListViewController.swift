//
//  FavoriteListViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 25/02/23.
//

import UIKit

class FavoriteListViewController: UIViewController {
    // MARK: - Properties
    let presenter: FavoriteListPresenter
    
    // MARK: - Initializers
    init(presenter: FavoriteListPresenter = FavoriteListPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.getFavoriteBeers()
    }
}

extension FavoriteListViewController: FavoriteListPresenterDelegate {
    
}
