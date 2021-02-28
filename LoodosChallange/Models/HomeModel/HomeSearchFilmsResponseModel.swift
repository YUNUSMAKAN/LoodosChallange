//
//  HomeSearchFilmsResponseModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import Foundation

struct HomeSearchFilmsResponseModel: Codable {
    
    let search : [HomeSearchList]?
    let totalResult: String?
    let response: String?
    
    enum CodingKeys: String,CodingKey {
        case search = "Search"
        case totalResult = "totalResults"
        case response = "Response"
    }
}

struct HomeSearchList: Codable {
    
    let title: String?
    let year: String?
    let imdbID: String?
    let type: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
