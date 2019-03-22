//
//  MovieDetailsModel.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

enum MoviesDetailsModel {
    struct Request {}
    struct Response {}
    struct ViewModel {
        let title: String
        let posterURL: URL?
        let trailerURL: URL?
        let summary: String
        let genre: String
        let director: String
    }
    
}
