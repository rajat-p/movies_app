//
//  Strings.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

struct Strings {
    struct Error {
        static let genericErrorTitle = NSLocalizedString("Error", comment: "Generic error title")
        static let genericErrorMessage = NSLocalizedString("Something went wrong. Please try again later.", comment: "Generic error message")
        static let okButtonTitle = NSLocalizedString("Ok", comment: "Alert button title")
        static let noNetworkMessage = NSLocalizedString("Mobile network not available. Please check your network conncetion and retry.", comment: "No network message")
        static let noDataMessage = NSLocalizedString("No data availaible.", comment: "No data message")
    }
}
