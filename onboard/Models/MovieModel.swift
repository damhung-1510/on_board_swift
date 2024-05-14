//
//  MovieModel.swift
//  onboard
//
//  Created by admin on 07/05/2024.
//

import Foundation
import ObjectMapper

struct MovieModel: Mappable, Decodable, Encodable {
    var adult: Int?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview, popularity: String?
    var posterPath, releaseDate, title: String?
    var video: Int?
    var voteAverage: String?
    var voteCount: Int?
    var isWatched: Bool = false
    
    init?(map: ObjectMapper.Map) {
    
    }
    
    mutating func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIDS <- map["genre_ids"]
        id <- map["id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
    
    
    
}
