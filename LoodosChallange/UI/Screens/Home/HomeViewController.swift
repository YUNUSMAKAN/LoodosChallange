//
//  HomeViewController.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Properties
    var viewModel = HomeViewModel()
    var writeText: String = ""

    //MARK:Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSearchBar()
        setTableView()
    }
}

extension HomeViewController {
    
    func searchFilms(title: String) {
        LoadingView.shared.show()
        viewModel.homeSearchFilmsList(title: title) { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
            LoadingView.shared.hide()
            if self.viewModel.homeSearchFilmsList.count < 1 {
                self.showAlert(title: "ERROR!", description: "NO MOVIE!")
            }
        }
    }
    
    private func showAlert(title: String, description: String) {
        DispatchQueue.main.async {
            let alertView = UIAlertController(title: title, message: description, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.searchBar.text = ""
            }))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    private func showMovieDetail(movieId: String) {
        
        let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "HomeDetailVC") as! HomeDetailViewController
        vc.viewModel.selectedFilmId = movieId
        LoadingView.shared.show()
        self.show(vc, sender: nil)
    }
}

//MARK:- UITableViewDelegate & UITableViewDataSource!
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchFilms = viewModel.homeSearchFilmsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        cell.filmNameLabel.text = "Name: \(searchFilms.title ?? "")"
        cell.filmYearLabel.text = "Year: \(searchFilms.year ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homeSearchFilmsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let chooseFilmId = viewModel.homeSearchFilmsList[indexPath.row].imdbID else { return }
        showMovieDetail(movieId: chooseFilmId)
    }
}

//MARK:UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    private func setSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = " Search to movies... "
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.writeText = searchText
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchText), object: nil)
        self.perform(#selector(self.searchText), with: nil, afterDelay: 0.5)
    }
    
    @objc private func searchText(text: String) {
        if self.writeText.count > 2 {
            searchFilms(title: self.writeText)
        }
    }
}
