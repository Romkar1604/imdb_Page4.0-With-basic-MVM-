//
//  ViewController.swift
//  imdb_Page4.0
//
//  Created by Omkar Ranawade on 2/3/26.
//

import UIKit

final class MoviesViewController: UIViewController {

    private let tableView = UITableView()
    private let viewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IMDb"
        view.backgroundColor = .white
        setupTable()
    }

    private func setupTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieCell.self,
                           forCellReuseIdentifier: MovieCell.id)

        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MoviesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfMovies()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieCell.id,
            for: indexPath
        ) as! MovieCell

        cell.configure(movie: viewModel.movie(at: indexPath.row))
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        let movie = viewModel.movie(at: indexPath.row)
        let vm = MovieDetailViewModel(movie: movie)
        let vc = MovieDetailViewController(viewModel: vm)

        // Works whether nav exists or not
        if let nav = navigationController {
            nav.pushViewController(vc, animated: true)
        } else {
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }
}
