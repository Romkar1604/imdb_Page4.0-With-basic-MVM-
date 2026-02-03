//
//  MoviesViewModel.swift
//  imdb_Page4.0
//
//  Created by Omkar Ranawade on 2/3/26.
//


final class MoviesViewModel {

    private let movies: [Movie] = [
        Movie(
            title: "Inception",
            popularity: 9.8,
            releaseYear: "2010",
            overview: "A thief who steals secrets through dream-sharing technology."
        ),
        Movie(
            title: "Interstellar",
            popularity: 9.6,
            releaseYear: "2014",
            overview: "Explorers travel through a wormhole in space."
        )
    ]

    func numberOfMovies() -> Int {
        movies.count
    }

    func movie(at index: Int) -> Movie {
        movies[index]
    }
    
}

