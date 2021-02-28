//
//  SearchFilmDetailRequestModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import Foundation

class HomeSearchFilmDetailRequestModel: RequestModel {
    
    private let id: String
    
    init(id: String) {
        
        self.id = id
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    override var path: String {
        return "\(Constant.ServicesConstant.baseUrl)?apikey=\(Constant.ServicesConstant.apiKey)"
    }
    
    override var method: RequestHTTPMethod {
        return .post
    }
    
    override var parameters: [String : Any?] {
        return [
            "i" : self.id
        ]
    }
}
