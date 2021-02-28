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
    var homeSearchFilms : [HomeSearchList] = []
    var writeText: String = ""
    var searchActive : Bool = false

    //MARK:Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchBar.placeholder = " Search to films... "
        self.searchBar.showsCancelButton = false
        searchFilms(title: "")
        setTableView()
    }
    
}
//MARK:Init Service
extension HomeViewController {
    
    func searchFilms(title: String) {
        
        viewModel.homeSearchFilmsList(title: title) { [weak self] in
            guard let self = self else {return}
            
            self.homeSearchFilms = self.viewModel.returnHomeSearchFilms()
            self.tableView.reloadData()
            
            if self.homeSearchFilms.count < 1 {
                let alert = UIAlertController(title: "ERROR", message: "No Films!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.searchBar.text = ""
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

//MARK:- UITableViewDelegate & UITableViewDataSource!
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let searchFilms = homeSearchFilms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        cell.filmNameLabel.text = "Name: \(searchFilms.title ?? "")"
        cell.filmYearLabel.text = "Year: \(searchFilms.year ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeSearchFilms.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chooseFilmId = homeSearchFilms[indexPath.row]
        let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "HomeDetailVC") as! HomeDetailViewController
        vc.selectedFilmId = chooseFilmId.imdbID!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.writeText = searchText
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchText), object: nil)
        self.perform(#selector(self.searchText), with: nil, afterDelay: 0.5)
    }
    
    @objc func searchText() {
        if self.writeText.count > 2 {
            homeSearchFilms = []
            tableView.reloadData()
            searchFilms(title: self.writeText)
        }
    }
}
