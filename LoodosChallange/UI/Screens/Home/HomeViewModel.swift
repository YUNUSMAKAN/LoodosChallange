//
//  HomeViewModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import Foundation

class HomeViewModel {
    
    var homeSearchFilmsList: [HomeSearchList] = []
    
    func homeSearchFilmsList(title: String, completion:@escaping (() -> Void)) {
        Services.homeSearchFilms(title: title) { (result) in
            switch result {
            case .success(let response):
                if response.totalResult != nil {
                    self.homeSearchFilmsList = response.search!
                    completion()
                }else {
                    self.homeSearchFilmsList = []
                    completion()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
