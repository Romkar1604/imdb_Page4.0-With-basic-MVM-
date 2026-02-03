//
//  MovieDetailViewController.swift
//  imdb_Page4.0
//
//  Created by Omkar Ranawade on 2/3/26.
//


import UIKit

final class MovieDetailViewController: UIViewController {

    private let viewModel: MovieDetailViewModel

    private let titleLabel = UILabel()
    private let yearLabel = UILabel()
    private let popularityLabel = UILabel()
    private let overviewLabel = UILabel()

    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Storyboard not used")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bind()
    }

    private func setupUI() {
        titleLabel.font = .boldSystemFont(ofSize: 24)
        overviewLabel.numberOfLines = 0

        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            yearLabel,
            popularityLabel,
            overviewLabel
        ])
        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func bind() {
        titleLabel.text = viewModel.title
        yearLabel.text = "Release: \(viewModel.releaseYear)"
        popularityLabel.text = viewModel.popularity
        overviewLabel.text = viewModel.overview
    }
}
