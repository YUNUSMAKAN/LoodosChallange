//
//  HomeDetailViewModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import Foundation

class HomeDetailViewModel {
    
    var homeSearchFilmDetail : HomeSearchFilmDetailResponseModel?
    
    func homeSearchFilmDetail(id: String, completion:@escaping (() -> Void)) {
        Services.homeSearchFilmsDetail(id: id) { (result) in
            switch result {
            case .success(let response):
                self.homeSearchFilmDetail = response
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func returnHomeSearchFilmDetail() -> HomeSearchFilmDetailResponseModel {
        return self.homeSearchFilmDetail!
    }
}
