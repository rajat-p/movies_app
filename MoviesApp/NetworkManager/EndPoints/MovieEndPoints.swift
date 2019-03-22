//
//  MovieEndPoints.swift
//  MoviesApp
//
//  Created by Rajat on 17/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

protocol BaseURL {
    static var baseURL: String { get }
}

enum APIBuilder {
    struct APIBuilderConstants {
        static let ApiScheme = "https"
        static let ApiHost = "s3.eu-west-2.amazonaws.com"
    }
}

extension APIBuilder : BaseURL {
    static var baseURL: String {
        return "\(APIBuilder.APIBuilderConstants.ApiScheme)://\(APIBuilder.APIBuilderConstants.ApiHost)"
    }
}

public enum MoviesApi {
    case getList
}

extension MoviesApi: EndPointType {
 
    var module: String {
        return "/ios-movies"
    }
    var path: String {
        switch self {
        case .getList:
            return "/list.json"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getList:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getList:
            return .request
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

