//
//  BeerListViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 11/02/23.
//

import UIKit

class BeerDetailViewController: UIViewController {
    // MARK: - Properties
    private let presenter: BeerDetailPresenter
    private let beerDetailView: BeerDetailView

    private lazy var saveButton: UIBarButtonItem = {
        let view = UIBarButtonItem(barButtonSystemItem: .save,
                                   target: self,
                                   action: #selector(favoriteButtonPressed))
        view.isHidden = true
        return view
    }()
    
    // MARK: - Initializers
    init(beerId: Int) {
        self.presenter = BeerDetailPresenter(beerId: beerId)
        self.beerDetailView = BeerDetailView()
        
        super.init(nibName: nil, bundle: nil)
        
        presenter.delegate = self
        presenter.getBeerDetail()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationItem.rightBarButtonItem = saveButton
    }

    override func loadView() {
        self.view = beerDetailView
    }
}

// MARK: - Presenter Delegate
extension BeerDetailViewController: BeerDetailPresenterDelegate {
    func loadDetails(of beer: BeerDetailViewModel) {
        DispatchQueue.main.async {
            self.saveButton.isHidden = false
            self.beerDetailView.load(viewModel: beer)
        }
    }
}

// MARK: - Actions
extension BeerDetailViewController {
    @objc
    private func favoriteButtonPressed() {
        presenter.saveBeer()
    }
}
