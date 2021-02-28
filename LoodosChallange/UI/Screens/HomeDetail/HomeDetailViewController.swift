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

        layout()
        viewModel.delegate = self
        
    }
}

//MARK: Init Service!
extension HomeDetailViewController: HomeDetailViewModelDelegate {
    
    private func layout() {
        imageView.layer.cornerRadius = 18
    }
    
    func setText(movieDetailResponse: HomeSearchFilmDetailResponseModel) {
        let url = URL(string: (movieDetailResponse.poster)!)
        imageView.kf.setImage(with: url)
        titleLabel.text = movieDetailResponse.title
        directorLabel.text = "Director:  \(movieDetailResponse.writer ?? "")"
        writerLabel.text = "Writer: \(movieDetailResponse.writer ?? "")"
        actorsLabel.text = "Actors:  \(movieDetailResponse.actors ?? "")"
        languageLabel.text = "Language:  \(movieDetailResponse.language ?? "")"
        countryLabel.text = "Country:  \(movieDetailResponse.country ?? "")"
        runtimeLabel.text = "Runtime: \(movieDetailResponse.runtime ?? "")"
        plotLabel.text = "Plot: \(movieDetailResponse.plot ?? "")"
        genreLabel.text = "Genre: \(movieDetailResponse.genre ?? "")"
        LoadingView.shared.hide()
    }
}
