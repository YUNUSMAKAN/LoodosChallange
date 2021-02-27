//
//  ViewController.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import UIKit
import Network
import FirebaseRemoteConfig


class SplashViewController: UIViewController {
    
    //MARK:Properties
   private let viewModel = SplashViewModel()
    
    //MARK:Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()

    }
}

//MARK:-Set UI!
extension SplashViewController {
    
    func initData(){
        
        viewModel.monitorNetwork { (state) in
            if state == true {
                self.viewModel.fetchValues { (title) in
                    DispatchQueue.main.async {
                        self.titleLabel.text = title
                        self.titleLabel.makeOutLine(oulineColor: .blue, foregroundColor: .black)
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "blackVC") as! BlackViewController
//                            vc.modalPresentationStyle = .fullScreen
//                            self.show(vc, sender: nil)
//                            
//                        }
                    }
                }
                
            }else {
                DispatchQueue.main.async {
                    let alertView = UIAlertController(title: "WARNING!!!", message: "NO INTERNET", preferredStyle: .alert)
                    alertView.addAction(.init(title: "OK", style: .default, handler: nil))
                    self.present(alertView, animated: true, completion: nil)
                }
            }
        }
    }
}

