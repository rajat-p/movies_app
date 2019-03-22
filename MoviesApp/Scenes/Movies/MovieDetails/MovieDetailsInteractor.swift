//
//  MovieDetailsInteractor.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

/// MARK:- Interaction Protocol
protocol MovieDetailsInteraction {
    /// function for storing selected movie
    func selectedMovie(movie: MoviesListModel.Response)
    /// function for loading movie details
    func loadMovieDetails()
    /// function for parsing youtube video id
    func parseYoutubeVideoId()
}

class MovieDetailsInteractor {
    var selectedMovie: MoviesListModel.Response?
    var presenter: MovieDetailsPresenter?
}

extension MovieDetailsInteractor: MovieDetailsInteraction {
    func parseYoutubeVideoId() {
        if let youtubeLink = selectedMovie?.trailerURL?.absoluteString.youtubeID {
            presenter?.presentYoutubeVideo(videoId: youtubeLink)
        }
    }
    
    func selectedMovie(movie: MoviesListModel.Response) {
        selectedMovie = movie
    }
    func loadMovieDetails() {
        if let movie = selectedMovie {
            presenter?.presentMovieDetails(movie: movie)
        }
    }
}
