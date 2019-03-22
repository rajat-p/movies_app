//
//  ActivityIndicatorHelper.swift
//  MoviesApp
//
//  Created by Rajat on 16/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

/// HUDHelper is a protocol for showing HUD on viewController
protocol HUDHelper {
    /// An object of activity indicator
    var activityIndicator: UIActivityIndicatorView { get }
    /// Function for showing activity indicator
    func showActivityIndicator()
    /// Function for hiding
    func hideActivityIndicator()
}

/// Extension of HUDHelper protocol for showing HUD on viewController
extension HUDHelper where Self: UIViewController {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.style = .whiteLarge
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height / 2)
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
            self.activityIndicator.color = UIColor.black
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}
