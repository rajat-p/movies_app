//
//  MoviesListPresenter.swift
//  MoviesApp
//
//  Created by Rajat on 17/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

/// MARK:- Presenter Protocol
protocol MovieListOutputPresenter: class {
    /// For displaying the movies
    func presentMovies(movies: [MoviesListModel.Response])
    /// For showing any error message
    func presentLoadingError(errorType: ErrorType)
}

class MoviesListPresenter {
    weak var movieDisplay: MovieDisplay?
}

extension MoviesListPresenter: MovieListOutputPresenter {
    func presentMovies(movies: [MoviesListModel.Response]) {
        var moviesViewModel: [MoviesListModel.ViewModel] = []
        moviesViewModel = movies.map { movie -> MoviesListModel.ViewModel in
            return MoviesListModel.ViewModel(title: movie.title, posterURL: movie.posterURL)
        }
        movieDisplay?.displayMovies(movies: moviesViewModel)
    }
    
    func presentLoadingError(errorType: ErrorType) {
        let errorViewModel = ErrorType.errorViewModel(errorType)
        movieDisplay?.displayError(error: errorViewModel)
    }
    
    
}
