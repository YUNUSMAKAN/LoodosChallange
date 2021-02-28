//
//  ViewController.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    //MARK:Properties
    
    private let viewModel = SplashViewModel()
    
    //MARK:Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       fetchValuesIfPossible()
    }
}

extension SplashViewController {
    
    private func fetchValuesIfPossible() {
        viewModel.fetchValuesIfNetworkAvailable { (title) in
            if let title = title {
                self.updateLabelText(text: title)
                self.presentHomeViewControllerAfterThreeSeconds()
            } else {
                self.showAlert(title: "WARNING!", description: "NO INTERNET!")
            }
        }
    }
    
    private func updateLabelText(text: String) {
        DispatchQueue.main.async {
            self.titleLabel.text = text
            self.titleLabel.makeOutLine(oulineColor: .blue, foregroundColor: .black)
        }
    }
    
    private func showAlert(title: String, description: String) {
        DispatchQueue.main.async {
            let alertView = UIAlertController(title: title, message: description, preferredStyle: .alert)
            alertView.addAction(.init(title: "OK", style: .default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    private func presentHomeViewControllerAfterThreeSeconds() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            self.show(vc, sender: nil)
        }
    }
}

