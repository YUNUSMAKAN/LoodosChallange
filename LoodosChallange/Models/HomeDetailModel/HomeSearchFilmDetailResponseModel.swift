//
//  SearchFilmDetailResponseModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import Foundation

struct HomeSearchFilmDetailResponseModel: Codable {
    
    let title: String?
    let year: String?
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director,writer,actors,plot: String?
    let language,country,awards,poster: String?
    let ratings: [DetailRatings]?
    let metascore,imdbRating,imdbVotes,imdbID,type: String?
    let dvd,boxOffice,production,website,response: String?
   
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings =  "Ratings"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

struct DetailRatings: Codable {
    
    let source : String?
    let value : String?
    
    enum CodingKeys: String,CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

