//
//  APIResponse.swift
//  MoviesApp
//
//  Created by Rajat on 17/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

struct APIResponse {
    var body: [String: Any]?
    var header: [String: Any]?
    var statusCode: Int?
    var errorMessage: String?
}
