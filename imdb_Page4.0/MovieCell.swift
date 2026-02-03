//
//  MovieCell.swift
//  imdb_Page4.0
//
//  Created by Omkar Ranawade on 2/3/26.
//


import UIKit

final class MovieCell: UITableViewCell {

    static let id = "MovieCell"

    private let titleLabel = UILabel()
    private let yearLabel = UILabel()
    private let popularityLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("Storyboard not used")
    }

    private func setup() {
        titleLabel.font = .boldSystemFont(ofSize: 18)
        popularityLabel.textColor = .systemOrange
        yearLabel.textColor = .gray

        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            yearLabel,
            popularityLabel
        ])
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = "Release: \(movie.releaseYear)"
        popularityLabel.text = "Movie Rating: \(movie.popularity)"
    }
}
