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
