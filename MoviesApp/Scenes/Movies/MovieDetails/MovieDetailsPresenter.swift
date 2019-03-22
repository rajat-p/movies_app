//
//  MovieDetailsPresenter.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

// MARK:- Presenter Protocol
protocol MovieDetailsOutputPresenter: class {
    /// function for displaying movie details
    func presentMovieDetails(movie: MoviesListModel.Response)
    /// function for playing youtube video
    func presentYoutubeVideo(videoId: String)
}

class MovieDetailsPresenter {
    weak var movieDisplay: MovieDetailsDisplay?
}

extension MovieDetailsPresenter: MovieDetailsOutputPresenter {
    func presentYoutubeVideo(videoId: String) {
        movieDisplay?.playYoutubeVideo(videoId: videoId)
    }
    
    func presentMovieDetails(movie: MoviesListModel.Response) {
        let movieDetailsViewModel: MoviesDetailsModel.ViewModel = MoviesDetailsModel.ViewModel(title: movie.title, posterURL: movie.posterURL, trailerURL: movie.trailerURL, summary: "Summary: \(movie.summary)", genre: "Genre: \(movie.genre)", director: "Directed By: \(movie.director)")
        movieDisplay?.displayMovieDetails(movieDetails: movieDetailsViewModel)
    }
}
