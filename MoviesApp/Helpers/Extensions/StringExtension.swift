//
//  StringExtension.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import Foundation

extension String {
    /// Get YouTube ID from any YouTube link
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }
        
        return (self as NSString).substring(with: result.range)
    }
    func dateToString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        if let date = dateFormatter.date(from:self) {
            return date
        } else {
            return nil
        }
    }
}
