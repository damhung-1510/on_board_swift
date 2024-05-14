//
//  MovieCell.swift
//  onboard
//
//  Created by admin on 07/05/2024.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
//    @IBOutlet weak var onMyWatchList: UILabel!

    @IBOutlet weak var movieTime: UILabel!
    
    @IBOutlet weak var onMyWatchList: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    func setUpData(movie: MovieModel){
        if let movieTitleString = movie.title {
            movieTitle.text = movieTitleString
        }
        movieTime.text = movie.releaseDate
        onMyWatchList.text =  movie.isWatched ? "On My Watch List" : ""
        moviePoster.af.setImage(withURL: URL(string: "\(AppConfig.posterBaseUrl)\((movie.posterPath ?? ""))")!)
    }
    
}
