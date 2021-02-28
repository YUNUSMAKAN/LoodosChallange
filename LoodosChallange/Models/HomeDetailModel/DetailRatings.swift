//
//  DetailRatings.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import Foundation

struct DetailRatings: Codable {
    
    let source : String?
    let value : String?
    
    enum CodingKeys: String,CodingKey {
        
        case source = "Source"
        case value = "Value"
    }
}
