//
//  MoviesListConfigurator.swift
//  MoviesApp
//
//  Created by Rajat on 17/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

class MoviesListConfigurator {
    /// For configuring controllers of VIP
    func configure(_ target: MoviesListViewController) {
        let interactor = MoviesListInteractor()
        let presenter = MoviesListPresenter()
        let router = MoviesListRouter()
        target.interactor = interactor
        target.router = router
        interactor.presenter = presenter
        presenter.movieDisplay = target
        router.viewController = target
        router.dataStore = interactor
    }
}
