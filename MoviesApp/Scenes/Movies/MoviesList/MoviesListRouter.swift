//
//  MoviesListRouter.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

/// MARK:- Router Protocol
protocol MoviesListRoutingLogic {
    /// Roting to movie details controller
    func routeToMovieDetails()
}
// MARK:- Data Passing Protocol
protocol MoviesListDataPassing {
    var dataStore: MoviesListDataStore? { get }
}

class MoviesListRouter: NSObject, MoviesListDataPassing {
    var dataStore: MoviesListDataStore?
    weak var viewController: MoviesListViewController!
}

extension MoviesListRouter: MoviesListRoutingLogic {
    func routeToMovieDetails() {
        if let detailController = Constants.Storyboard.kMoviesStoryboard.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifier.kMovieDetailsViewController) as? MovieDetailsViewController, let selectedMovie = dataStore?.selectedMovie {
            MovieDetailsConfigurator().configure(detailController)
            detailController.interactor?.selectedMovie(movie: selectedMovie)
            viewController.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
