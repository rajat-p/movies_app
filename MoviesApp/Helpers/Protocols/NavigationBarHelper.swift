//
//  NavigationBarHelper.swift
//  MoviesApp
//
//  Created by Rajat on 16/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

/// NavigationBarHelper is a protocol for setting the theme of Navigation Bar
protocol NavigationBarHelper {
    /// Customize Navigation Bar
    ///
    /// - parameter navigationBar: The navigationBar object which need to be customized
    func setNavBarStyle(navigationBar: UINavigationBar)
}

/// Extension of NavigationBarHelper protocol for common view controller
extension NavigationBarHelper {
    func setNavBarStyle(navigationBar: UINavigationBar) {
        navigationBar.barTintColor = UIColor.black
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
