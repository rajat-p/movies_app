//
//  MovieDetailsConfigurator.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation
class MovieDetailsConfigurator {
    /// For configuring controllers of VIP
    func configure(_ target: MovieDetailsViewController) {
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        target.interactor = interactor
        interactor.presenter = presenter
        presenter.movieDisplay = target
    }
}
