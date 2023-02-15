//
//  BeerDetailView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 13/02/23.
//

import UIKit

final class BeerDetailView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillProportionally
        view.spacing = CGFloat(20)
        view.preservesSuperviewLayoutMargins = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var name: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textAlignment = .left
        view.text = "Name property"
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var taglineAndVolume: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 18)
        view.textAlignment = .center
        view.text = "Tagline and Volume properties"
        view.backgroundColor = .systemGray5
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var image: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .green
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var abvAndIbuStack: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = CGFloat(20)
        view.backgroundColor = .systemGray5
        view.preservesSuperviewLayoutMargins = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var abv: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .right
        view.text = "ABV property"
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ibu: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text = "IBU property"
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var footerTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .center
        view.text = "Footer title"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var footerContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.italicSystemFont(ofSize: 16)
        view.textAlignment = .left
        view.text =
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Pellentesque porttitor venenatis enim, at ullamcorper felis varius nec. Ut risus ligula, commodo a suscipit eget, interdum id tortor.
Donec varius nec leo eu sagittis. Nunc malesuada quam eu scelerisque consectetur.
Nullam imperdiet, erat at feugiat gravida, metus massa pellentesque dolor, quis eleifend lacus urna ac augue.

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Pellentesque porttitor venenatis enim, at ullamcorper felis varius nec. Ut risus ligula, commodo a suscipit eget, interdum id tortor.
Donec varius nec leo eu sagittis. Nunc malesuada quam eu scelerisque consectetur.
Nullam imperdiet, erat at feugiat gravida, metus massa pellentesque dolor, quis eleifend lacus urna ac augue.
"""
        view.backgroundColor = .systemGray5
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        viewCodeSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BeerDetailView: ViewCodeProtocol {
    func setViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(container)

        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(taglineAndVolume)
        stackView.addArrangedSubview(image)
        
        abvAndIbuStack.addArrangedSubview(abv)
        abvAndIbuStack.addArrangedSubview(ibu)
        stackView.addArrangedSubview(abvAndIbuStack)
        
        stackView.addArrangedSubview(footerTitle)
        stackView.addArrangedSubview(footerContent)
        
        container.addSubview(stackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            image.heightAnchor.constraint(equalToConstant: 400),
            
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: container.widthAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: container.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            abvAndIbuStack.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
        
    }
    
    func setAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}
