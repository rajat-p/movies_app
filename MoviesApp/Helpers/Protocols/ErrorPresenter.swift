//
//  ErrorPresenter.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

/// _ErrorPresenter_ is a protocol for presenting errors
protocol ErrorPresenter {
    
    /// Present an error given an error view model
    ///
    /// - parameter viewModel: The view model for the error
    func presentError(viewModel: ErrorViewModel)
}


/// Extension of _ErrorPresenter_ protocol for common view controller error handling
extension ErrorPresenter where Self: UIViewController {
    func presentError(viewModel: ErrorViewModel) {
        let alertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        for title in viewModel.buttonTitles {
            let action = UIAlertAction(title: title, style: .default, handler: nil)
            alertController.addAction(action)
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
