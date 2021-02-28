//
//  HomeDetailViewModel.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import Foundation
import Firebase

protocol HomeDetailViewModelDelegate {
    func setText(movieDetailResponse: HomeSearchFilmDetailResponseModel)
}

class HomeDetailViewModel {
    
    var selectedFilmId: String = "" {
        didSet {
            fetchMovieDetail(id: selectedFilmId)
        }
    }
    
    var delegate: HomeDetailViewModelDelegate?
    
    private func fetchMovieDetail(id: String) {
        Services.homeSearchFilmsDetail(id: id) { (result) in
            switch result {
            case .success(let response):
                self.delegate?.setText(movieDetailResponse: response)
                self.anaylticsEventLoger(movieDetailResponse: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func anaylticsEventLoger(movieDetailResponse: HomeSearchFilmDetailResponseModel) {
        Analytics.logEvent("home_detail_view", parameters: [
            "image_view": movieDetailResponse.poster ?? "",
            "title_label": movieDetailResponse.title ?? "",
            "director_label": movieDetailResponse.director ?? "",
            "writer_label": movieDetailResponse.writer ?? "",
            "actors_label" : movieDetailResponse.actors ?? "",
            "language_label" : movieDetailResponse.language ?? "",
            "country_label" : movieDetailResponse.country ?? "",
            "runtime_label" : movieDetailResponse.runtime ?? "",
            "plot_label": movieDetailResponse.plot ?? "",
            "genre_label": movieDetailResponse.genre ?? ""
        ])
    }
}
