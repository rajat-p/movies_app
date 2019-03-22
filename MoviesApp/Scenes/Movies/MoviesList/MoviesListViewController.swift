//
//  MoviesListViewController.swift
//  MoviesApp
//
//  Created by Rajat on 16/03/19.
//  Copyright © 2019 Systango. All rights reserved.
//

import UIKit

// MARK:- View Controller Protocol
protocol MovieDisplay: class {
    /// function for displaying movie details
    func displayMovies(movies: [MoviesListModel.ViewModel])
    /// function for displaying movie details
    func displayError(error: ErrorViewModel)
}

class MoviesListViewController: UIViewController, NavigationBarHelper, HUDHelper, ErrorPresenter {
    
    @IBOutlet weak var tableView: UITableView!
    var activityIndicator = UIActivityIndicatorView()
    var movies: [MoviesListModel.ViewModel] = []
    
    var interactor: MovieListInteraction?
    var router: MoviesListRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        MoviesListConfigurator().configure(self)
        if let navBar = navigationController?.navigationBar {
            setNavBarStyle(navigationBar: navBar)
        }
        showActivityIndicator()
        interactor?.loadMovies()
        title = "Movies"
    }
}

extension MoviesListViewController: MovieDisplay {
    func displayError(error: ErrorViewModel) {
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.presentError(viewModel: error)
        }
    }
    
    func displayMovies(movies: [MoviesListModel.ViewModel]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.tableView.reloadData()
        }
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifier.kMoviesListTableViewCell, for: indexPath) as? MoviesListTableViewCell else {
            assert(false, "Invalid table view cell")
            return UITableViewCell()
        }
        
        let movieListViewModel = self.movies[indexPath.row]
        cell.movieListViewModel = movieListViewModel
        
        cell.selectionStyle = .none
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.selectedMovie(request: MoviesListModel.Request(selectedIndexPath: indexPath))
        router?.routeToMovieDetails()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
