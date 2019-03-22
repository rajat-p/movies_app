//
//  MoviesListInteractor.swift
//  MoviesApp
//
//  Created by Rajat on 17/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

/// MARK:- Interaction Protocol
protocol MovieListInteraction {
    /// Function for loading the list of movies
    func loadMovies()
    /// Function for passing the selected movie
    func selectedMovie(request: MoviesListModel.Request)
}

protocol MoviesListDataStore {
    var selectedMovie: MoviesListModel.Response! { get }
}

class MoviesListInteractor: MoviesListDataStore {
    var selectedMovie: MoviesListModel.Response!
    
    var presenter: MoviesListPresenter?
    
    var movies: [MoviesListModel.Response] = []

}

extension MoviesListInteractor: MovieListInteraction {
    func selectedMovie(request: MoviesListModel.Request) {
        selectedMovie = movies[request.selectedIndexPath.row]
    }
    
    func loadMovies() {
        let apiManager = APIManager()
        apiManager.getMovies { (result) in
            switch result {
            case .success(let response):
                if let moviesResponse = response.body {
                    self.movies = MoviesListModel.Response.fromJSON(json: moviesResponse)
                    if self.movies.count > 0 {
                        self.presenter?.presentMovies(movies: self.movies)
                    } else {
                        self.presenter?.presentLoadingError(errorType: .noData)
                    }
                } else {
                    self.presenter?.presentLoadingError(errorType: .invalidResponse)
                }
            case .failure(let errorType):
                self.presenter?.presentLoadingError(errorType: errorType)
            }
        }
    }
}

