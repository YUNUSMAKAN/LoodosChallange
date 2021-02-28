//
//  HomeDetailViewController.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import UIKit
import Kingfisher
import Firebase

class HomeDetailViewController: UIViewController {
    
    //MARK: Properties
    
    var viewModel = HomeDetailViewModel()
    var selectedFilmId: String = ""
    var homeSearcFilmDetail: HomeSearchFilmDetailResponseModel?
    
    //MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchFilmDetail(id: selectedFilmId)
        imageView.layer.cornerRadius = 18
      
    }

}

//MARK: Init Service!
extension HomeDetailViewController {
    
    func searchFilmDetail(id: String) {
        viewModel.homeSearchFilmDetail(id: id) { [weak self] in
            guard let self = self else {return}
            self.homeSearcFilmDetail = self.viewModel.returnHomeSearchFilmDetail()
            self.setText()
            self.anaylticsEventLoger()
        }
    }
    
    func setText() {
        
        let url = URL(string: (homeSearcFilmDetail?.poster)!)
        imageView.kf.setImage(with: url)
        titleLabel.text = homeSearcFilmDetail?.title
        directorLabel.text = "Director:  \(homeSearcFilmDetail?.writer ?? "")"
        writerLabel.text = "Writer: \(homeSearcFilmDetail?.writer ?? "")"
        actorsLabel.text = "Actors:  \(homeSearcFilmDetail?.actors ?? "")"
        languageLabel.text = "Language:  \(homeSearcFilmDetail?.language ?? "")"
        countryLabel.text = "Country:  \(homeSearcFilmDetail?.country ?? "")"
        runtimeLabel.text = "Runtime: \(homeSearcFilmDetail?.runtime ?? "")"
        plotLabel.text = "Plot: \(homeSearcFilmDetail?.plot ?? "")"
        genreLabel.text = "Genre: \(homeSearcFilmDetail?.genre ?? "")"
    }
    
    func anaylticsEventLoger(){
        Analytics.logEvent("home_detail_view", parameters: [
            "image_view": homeSearcFilmDetail?.poster ?? "",
            "title_label": titleLabel.text ?? "",
            "director_label": directorLabel.text ?? "",
            "writer_label": writerLabel.text ?? "",
            "actors_label" : actorsLabel.text ?? "",
            "language_label" : languageLabel.text ?? "",
            "country_label" : countryLabel.text ?? "",
            "runtime_label" : runtimeLabel.text ?? "",
            "plot_label": plotLabel.text ?? "",
            "genre_label": genreLabel.text ?? ""
        ])
    }
}
