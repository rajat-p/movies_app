//
//  EndPointType.swift
//  MoviesApp
//
//  Created by Rajat on 17/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

protocol EndPointType {
    var path: String { get }
    var module: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: [String: String]? { get }
}
