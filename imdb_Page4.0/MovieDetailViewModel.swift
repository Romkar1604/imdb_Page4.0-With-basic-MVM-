//
//  MovieDetailViewModel.swift
//  imdb_Page4.0
//
//  Created by Omkar Ranawade on 2/3/26.
//


final class MovieDetailViewModel {

    private let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    var title: String { movie.title }
    var releaseYear: String { movie.releaseYear }
    var popularity: String { " \(movie.popularity)" }
    var overview: String { movie.overview }
}
