//
//  MoviesModel.swift
//  MoviesApp
//
//  Created by Rajat on 16/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

enum MoviesListModel {
    struct Request {
        let selectedIndexPath: IndexPath
    }
    struct Response {
        let title: String
        var trailerURL: URL?
        var posterURL: URL?
        let summary: String
        var year: Date?
        let genre: String
        let director: String
        
        init(dict: [String: Any]) {
            if let title = dict[MovieListAPIResponseKeys.title] as? String {
                self.title = title
            } else {
                self.title = ""
            }
            if let trailerURLString = dict[MovieListAPIResponseKeys.trailer] as? String, let url = URL(string: trailerURLString) {
                self.trailerURL = url
            }
            if let posterURLString = dict[MovieListAPIResponseKeys.poster] as? String, let url = URL(string: posterURLString) {
                self.posterURL = url
            }
            if let summary = dict[MovieListAPIResponseKeys.summary] as? String {
                self.summary = summary
            } else {
                self.summary = ""
            }
            if let year = dict[MovieListAPIResponseKeys.year] as? String {
                if let date = year.dateToString() {
                    self.year = date
                }
            }
            if let genre = dict[MovieListAPIResponseKeys.genre] as? String {
                self.genre = genre
            } else {
                self.genre = ""
            }
            if let director = dict[MovieListAPIResponseKeys.director] as? String {
                self.director = director
            } else {
                self.director = ""
            }
        }
    }
    struct ViewModel {
        let title: String
        let posterURL: URL?
    }
    
}


extension MoviesListModel.Response: Parsable {
    
    typealias T = [MoviesListModel.Response]
    
    struct MovieListAPIResponseKeys {
        static let kDataKey = "data"
        static let title = "title"
        static let trailer = "trailer"
        static let poster = "poster"
        static let summary = "summary"
        static let year = "year"
        static let genre = "genre"
        static let director = "director"
    }
    
    static func fromJSON(json: [String: Any]) -> [MoviesListModel.Response] {
        var movies: [MoviesListModel.Response] = []
        if let moviesArray = json[MovieListAPIResponseKeys.kDataKey] as? [[String: Any]] {
            movies = moviesArray.map { movie -> MoviesListModel.Response in
                return MoviesListModel.Response(dict: movie)
            }
            return movies
        } else {
            return movies
        }
    }
}
        




