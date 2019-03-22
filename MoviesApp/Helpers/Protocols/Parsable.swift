//
//  Parsable.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

// MARK: - Parsable

/// _Parsable_ is a protocol to specify parsing behaviour
protocol Parsable {
    
    associatedtype T
    
    /// Converts a JSON dictionary into a generic object type T
    ///
    /// - parameter json: JSON dictionary
    ///
    /// - returns: The generic object type
    static func fromJSON(json: [String: Any]) -> T
}
