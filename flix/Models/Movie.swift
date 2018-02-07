//
//  Movie.swift
//  flix
//
//  Created by Eli Scherrer on 2/7/18.
//  Copyright © 2018 Eli Scherrer. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String
    var overview: String
    var releaseDate: String
    
    var posterPath: String
    var posterUrl: URL?
    
    var backdropPath: String
    var backdropUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No description"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        
        posterPath = dictionary["poster_path"] as? String ?? "No path"
        posterUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)
        
        backdropPath = dictionary["backdrop_path"] as? String ?? "No path"
        backdropUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath)
        
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
