//
//  MovieDetailViewController.swift
//  onboard
//
//  Created by admin on 13/05/2024.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: MovieModel?
    
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var titleFilm: UILabel!
    
    @IBOutlet weak var watchTrailerButton: UIButton!
    @IBOutlet weak var addToWatchlistButton: UIButton!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem?.title = "Back to movies"
        setUpData(movie: movie!)
        
        watchTrailerButton.layer.cornerRadius = 20
        addToWatchlistButton.backgroundColor = .clear
        addToWatchlistButton.layer.cornerRadius = 20
        addToWatchlistButton.setTitleColor(UIColor.white, for: .normal)
        addToWatchlistButton.layer.borderWidth = 1
        addToWatchlistButton.layer.borderColor = UIColor.white.cgColor
        
        if(movie?.isWatched == true){
            addToWatchlistButton.isHidden = true
        }
        
    }
    
    func setUpData(movie: MovieModel){
        if let movieTitleString = movie.title {
            titleFilm.text = movieTitleString
        }
        releasedDate.text = "Release date: \(String(describing: movie.releaseDate!))"
        rating.text = "Rating: 7.8/10"
        type.text = "Genre: \(String(describing: movie.adult!))"
        movieDescription.text = movie.overview
        duration.text = "Duration: 120 min"
        posterImg.af.setImage(withURL: URL(string: "\(AppConfig.posterBaseUrl)\((movie.posterPath ?? ""))")!)
    }
    
    @IBAction func onAddToWatchlist(_ sender: Any) {
        var movies = UserDefaultsHelper.shared.loadMovies() ?? []
        movies.append(movie!)
        UserDefaultsHelper.shared.saveMovies(movies)
    }
}
