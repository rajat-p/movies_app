//
//  MoviesListTableViewCell.swift
//  MoviesApp
//
//  Created by Rajat on 16/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesListTableViewCell: UITableViewCell {
    var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    var movieListViewModel: MoviesListModel.ViewModel! {
        didSet {
            initializeCell(movieListViewModel: movieListViewModel)
        }
    }
    private func initializeCell(movieListViewModel: MoviesListModel.ViewModel) {
        movieTitleLabel.text = movieListViewModel.title
        moviePosterImageView.kf.setImage(with: movieListViewModel.posterURL, placeholder: UIImage(named: "placeholderImage"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
