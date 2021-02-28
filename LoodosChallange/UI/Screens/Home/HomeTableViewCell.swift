//
//  HomeTableViewCell.swift
//  LoodosChallange
//
//  Created by MAKAN on 28.02.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //MARK: Outlets.
    
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
