//
//  UserDefaultsHelper.swift
//  onboard
//
//  Created by admin on 09/05/2024.
//

import Foundation


class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    let _myWatchListKey = "my-watch-list"
    
    private init() {}
    
    func saveMovies(_ movies: [MovieModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movies) {
            UserDefaults.standard.set(encoded, forKey: _myWatchListKey)
        }
    }
    
    func loadMovies() -> [MovieModel]? {
        if let data = UserDefaults.standard.data(forKey: _myWatchListKey),
            let movies = try? JSONDecoder().decode([MovieModel].self, from: data) {
            return movies
        }
        return nil
    }
}
