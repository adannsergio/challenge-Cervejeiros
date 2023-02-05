//
//  ViewController.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 03/02/23.
//

import UIKit

class BeerListViewController: UIViewController {
    
    private var beerListView: BeerListView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    init() {
        self.beerListView = BeerListView()
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = beerListView
    }
    
}


