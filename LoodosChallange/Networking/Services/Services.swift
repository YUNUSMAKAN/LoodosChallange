//
//  Services.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import Foundation
import Alamofire

public class Services {
    
    typealias completionHandler<T> = Swift.Result<T, AFError>
    
    class func homeSearchFilms(title: String, completion: @escaping(Swift.Result<HomeSearchFilmsResponseModel,AFError>) -> Void) {
        ServiceManager.shared.sendRequest(request: HomeSearchFilmsRequestModel(title: title)) { (result) in
            completion(result)
        }
    }
    
    class func homeSearchFilmsDetail(id: String, completion:@escaping(Swift.Result<HomeSearchFilmDetailResponseModel,AFError>) ->Void) {
        ServiceManager.shared.sendRequest(request: HomeSearchFilmDetailRequestModel(id: id)) { (result) in
            completion(result)
        }
    }
}
