//
//  FavoriteCollectionViewCell.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 15/04/23.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    private lazy var beerImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "beerPlaceholder")
        view.contentMode = .scaleAspectFit
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var beerName: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "ABV property"
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializers
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        viewCodeSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoriteCollectionViewCell {
    struct Configuration {
        let imageData: Data?
        let beerName: String
    }

    public func load(configuration: Configuration) {
        beerName.text = configuration.beerName

        guard let imageData = configuration.imageData else { return }
        beerImage.image = UIImage(data: imageData)
    }
}

extension FavoriteCollectionViewCell: ViewCodeProtocol {
    func setViewHierarchy() {
        addSubview(beerImage)
        addSubview(beerName)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            beerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            beerImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            beerImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            beerImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 4/9),
            
            beerName.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 5),
            beerName.topAnchor.constraint(equalTo: topAnchor),
            beerName.trailingAnchor.constraint(equalTo: trailingAnchor),
            beerName.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        let cellHeight = heightAnchor.constraint(equalToConstant: 150)
        cellHeight.priority = .defaultHigh
        cellHeight.isActive = true
    }

    func setAdditionalConfiguration() {
        backgroundColor = .white
    }
}
