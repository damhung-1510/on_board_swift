//
//  MoviesViewController.swift
//  onboard
//
//  Created by admin on 07/05/2024.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    var movies :[MovieModel] = []
    var localMovies :[MovieModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
        
        APIManager.shared.fetchData(from: AppConfig.moviesList) { result in
            switch result {
            case .success(let value):
                // Xử lý dữ liệu thành công
                self.movies = value as! [MovieModel]
                self.moviesTableView.reloadData()
                print("Dữ liệu nhận được: \(value)")
            case .failure(let error):
                // Xử lý lỗi
                print("Lỗi: \(error)")
            }
            
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        localMovies = UserDefaultsHelper.shared.loadMovies() ?? []
        moviesTableView.reloadData()
    }
}


extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
                    fatalError("Unable to dequeue MovieCell")
                }
                
        var movie = movies[indexPath.row]
        
        let index = localMovies.firstIndex(where: {localMovie in localMovie.id == movie.id})
        if(index != nil){
            movie.isWatched = true
        }
        cell.setUpData(movie: movie)
        cell.moviePoster.layer.cornerRadius = 10
        cell.moviePoster.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.item]
        showMovieDetail(movie: selectedMovie)
    }

    
    func showMovieDetail(movie: MovieModel) {
               
        if let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            movieDetailVC.movie = movie
           
            self.navigationController?.pushViewController(movieDetailVC, animated: true)
        }
        
    
    }
}
