//
//  HomeSearchFilmsRequestModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import Foundation

class HomeSearchFilmsRequestModel: RequestModel {
    
    private let title: String
    
    init(title: String) {
        
        self.title = title
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
        "s" : self.title
        ]
        
    }
   
}
