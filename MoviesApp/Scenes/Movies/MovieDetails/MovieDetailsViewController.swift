//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Rajat on 22/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

// MARK:- View Controller Protocol
protocol MovieDetailsDisplay: class {
    /// function for displaying movie details
    func displayMovieDetails(movieDetails: MoviesDetailsModel.ViewModel)
    /// function for playing youtube video
    func playYoutubeVideo(videoId: String)
}

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var directedByLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var trailerPlayerView: YTPlayerView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    var interactor: MovieDetailsInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        trailerPlayerView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.loadMovieDetails()
    }
    @IBAction func playButtonTapped(_ sender: Any) {
        playButton.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        interactor?.parseYoutubeVideoId()
    }
}

extension MovieDetailsViewController: MovieDetailsDisplay {
    func displayMovieDetails(movieDetails: MoviesDetailsModel.ViewModel) {
        movieTitleLabel.text = movieDetails.title
        summaryLabel.text = movieDetails.summary
        genreLabel.text = movieDetails.genre
        directedByLabel.text = movieDetails.director
        title = movieDetails.title
    }
    
    func playYoutubeVideo(videoId: String) {
        self.trailerPlayerView.load(withVideoId: videoId)
    }
}

extension MovieDetailsViewController: YTPlayerViewDelegate {
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        if state == .ended {
           playButton.isHidden = false
        } else {
            playButton.isHidden = true
        }
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        activityIndicator.isHidden = true
    }
}
