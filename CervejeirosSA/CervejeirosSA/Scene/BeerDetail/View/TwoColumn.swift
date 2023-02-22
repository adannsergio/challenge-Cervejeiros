//
//  TwoColumn.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 16/02/23.
//

import UIKit

final class TwoColumn: UIView {
    // MARK: - Properties

    private lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.preservesSuperviewLayoutMargins = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var leftColumnImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "beerPlaceholder")
        view.contentMode = .scaleAspectFit
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rightColumnContainer: UIView = {
        let view = UIView(frame: .zero)
        view.preservesSuperviewLayoutMargins = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstItemText: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "ABV property"
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondItemText: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "IBU property"
        view.sizeToFit()
        view.baselineAdjustment = .alignCenters
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdItemText: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "PH property"
        view.sizeToFit()
        view.baselineAdjustment = .alignCenters
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fourthItemText: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "Malt: Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        view.numberOfLines = 0
        view.sizeToFit()
        view.baselineAdjustment = .alignCenters
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fifthItemText: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "Hops: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        view.numberOfLines = 0
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
// MARK: - Public Content
extension TwoColumn {
    struct Configuration {
        let firstItemText: NSAttributedString
        let secondItemText: NSAttributedString
        let thirdItemText: NSAttributedString
        let fourthItemText: NSAttributedString
        let fifthItemText: NSAttributedString
        let imageData: Data
    }
    
    public func load(configuration: Configuration) {
        leftColumnImage.image = UIImage(data: configuration.imageData)
        firstItemText.attributedText = configuration.firstItemText
        secondItemText.attributedText = configuration.secondItemText
        thirdItemText.attributedText = configuration.thirdItemText
        fourthItemText.attributedText = configuration.fourthItemText
        fifthItemText.attributedText = configuration.fifthItemText
    }
}

// MARK: - View Code Configuration
extension TwoColumn: ViewCodeProtocol {
    func setViewHierarchy() {
        container.addSubview(leftColumnImage)
        container.addSubview(rightColumnContainer)
        container.addSubview(firstItemText)
        container.addSubview(secondItemText)
        container.addSubview(thirdItemText)
        container.addSubview(fourthItemText)
        container.addSubview(fifthItemText)
        
        addSubview(container)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leftColumnImage.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            leftColumnImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            leftColumnImage.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            leftColumnImage.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 4/9),
            
            rightColumnContainer.leadingAnchor.constraint(equalTo: leftColumnImage.trailingAnchor, constant: 5),
            rightColumnContainer.topAnchor.constraint(equalTo: container.topAnchor),
            rightColumnContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            rightColumnContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            firstItemText.leadingAnchor.constraint(equalTo: rightColumnContainer.leadingAnchor),
            firstItemText.topAnchor.constraint(equalTo: rightColumnContainer.topAnchor, constant: 25),
            firstItemText.trailingAnchor.constraint(equalTo: rightColumnContainer.trailingAnchor),

            secondItemText.leadingAnchor.constraint(equalTo: rightColumnContainer.leadingAnchor),
            secondItemText.topAnchor.constraint(equalTo: firstItemText.bottomAnchor, constant: 12),
            secondItemText.trailingAnchor.constraint(equalTo: rightColumnContainer.trailingAnchor),

            thirdItemText.leadingAnchor.constraint(equalTo: rightColumnContainer.leadingAnchor),
            thirdItemText.topAnchor.constraint(equalTo: secondItemText.bottomAnchor, constant: 12),
            thirdItemText.trailingAnchor.constraint(equalTo: rightColumnContainer.trailingAnchor),

            fourthItemText.leadingAnchor.constraint(equalTo: rightColumnContainer.leadingAnchor),
            fourthItemText.topAnchor.constraint(equalTo: thirdItemText.bottomAnchor, constant: 12),
            fourthItemText.trailingAnchor.constraint(equalTo: rightColumnContainer.trailingAnchor),

            fifthItemText.leadingAnchor.constraint(equalTo: rightColumnContainer.leadingAnchor),
            fifthItemText.topAnchor.constraint(equalTo: fourthItemText.bottomAnchor, constant: 12),
            fifthItemText.trailingAnchor.constraint(equalTo: rightColumnContainer.trailingAnchor),
            fifthItemText.bottomAnchor.constraint(lessThanOrEqualTo: rightColumnContainer.bottomAnchor)
        ])
    }
    
    func setAdditionalConfiguration() {}
}
