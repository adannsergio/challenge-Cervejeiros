//
//  BeerDetailView.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 13/02/23.
//

import UIKit

final class BeerDetailView: UIView {
    // MARK: - Properties
    private enum BeerDetailViewState {
        case loading
        case ready
    }

    private var state: BeerDetailViewState {
        didSet {
            switch state {
            case .ready:
                scrollView.isHidden = false
            case .loading:
                scrollView.isHidden = true
            }
        }
    }

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = CGFloat(20)
        view.preservesSuperviewLayoutMargins = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var name: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textAlignment = .left
        view.text = "Name property"
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var taglineAndVolume: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 18)
        view.textAlignment = .center
        view.text = "Tagline and Volume properties"
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var twoColumn: TwoColumn = {
        let view = TwoColumn(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .center
        view.text = "Description"
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text =
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Pellentesque porttitor venenatis enim, at ullamcorper felis varius nec. Ut risus ligula, commodo a suscipit eget, interdum id tortor.
Donec varius nec leo eu sagittis. Nunc malesuada quam eu scelerisque consectetur.
Nullam imperdiet, erat at feugiat gravida, metus massa pellentesque dolor, quis eleifend lacus urna ac augue.
"""
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var foodPairingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .center
        view.text = "Food Pairing"
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var foodPairingContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .left
        view.text =
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Pellentesque porttitor venenatis enim, at ullamcorper felis varius nec. Ut risus ligula, commodo a suscipit eget, interdum id tortor.
Donec varius nec leo eu sagittis. Nunc malesuada quam eu scelerisque consectetur.
Nullam imperdiet, erat at feugiat gravida, metus massa pellentesque dolor, quis eleifend lacus urna ac augue.
"""
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var brewerTipsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .center
        view.text = "Brewer Tips"
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var brewerTipsContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.italicSystemFont(ofSize: 16)
        view.textAlignment = .left
        view.text =
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Pellentesque porttitor venenatis enim, at ullamcorper felis varius nec. Ut risus ligula, commodo a suscipit eget, interdum id tortor.
Donec varius nec leo eu sagittis. Nunc malesuada quam eu scelerisque consectetur.
Nullam imperdiet, erat at feugiat gravida, metus massa pellentesque dolor, quis eleifend lacus urna ac augue.
"""
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializers
    override init(frame: CGRect = .zero) {
        self.state = .loading

        super.init(frame: frame)

        viewCodeSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Content
extension BeerDetailView {
    func load(viewModel: BeerDetailViewModel) {
        name.text = viewModel.name
        taglineAndVolume.text = viewModel.taglineAndVolume
        descriptionContent.text = viewModel.description
        foodPairingContent.text = viewModel.foodPairing
        brewerTipsContent.text = viewModel.brewerTip

        twoColumn
            .load(configuration:
                    .init(firstItemText: viewModel.abv,
                          secondItemText: viewModel.ibu,
                          thirdItemText: viewModel.ph,
                          fourthItemText: viewModel.malt,
                          fifthItemText: viewModel.hops,
                          imageData: viewModel.imageData))

        state = .ready
    }
}

// MARK: - View Code Configuration
extension BeerDetailView: ViewCodeProtocol {
    func setViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(container)

        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(taglineAndVolume)
        stackView.addArrangedSubview(twoColumn)
        stackView.addArrangedSubview(descriptionTitle)
        stackView.addArrangedSubview(descriptionContent)
        stackView.addArrangedSubview(foodPairingTitle)
        stackView.addArrangedSubview(foodPairingContent)
        stackView.addArrangedSubview(brewerTipsTitle)
        stackView.addArrangedSubview(brewerTipsContent)

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

            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: container.widthAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: container.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor),

            twoColumn.heightAnchor.constraint(equalToConstant: 350)
        ])
    }

    func setAdditionalConfiguration() {
        stackView.setCustomSpacing(25, after: taglineAndVolume)
        stackView.setCustomSpacing(25, after: twoColumn)
        backgroundColor = .white
        state = .loading
    }
}
