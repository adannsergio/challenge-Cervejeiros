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
        let view = UIBarButtonItem(title: "Favorite",
                                   image: nil,
                                   target: self,
                                   action: #selector(saveButtonPressed))
        return view
    }()
    
    private lazy var deleteButton: UIBarButtonItem = {
        let view = UIBarButtonItem(title: "Unfavorite",
                                   image: nil,
                                   target: self,
                                   action: #selector(deleteButtonPressed))
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
    }

    override func loadView() {
        self.view = beerDetailView
    }
}

// MARK: - Presenter Delegate
extension BeerDetailViewController: BeerDetailPresenterDelegate {
    func loadDetails(of beer: BeerDetailViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            sSelf.beerDetailView.load(viewModel: beer)
        }
    }

    func configureSaveButton() {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            sSelf.navigationItem.rightBarButtonItem = sSelf.saveButton
        }
    }

    func configureDeleteButton() {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            sSelf.navigationItem.rightBarButtonItem = sSelf.deleteButton
        }
    }
}

// MARK: - Actions
extension BeerDetailViewController {
    @objc
    private func saveButtonPressed() {
        presenter.saveBeer()
        configureDeleteButton()
    }
    
    @objc
    private func deleteButtonPressed() {
        presenter.deleteBeer()
        configureSaveButton()
    }
    
}
