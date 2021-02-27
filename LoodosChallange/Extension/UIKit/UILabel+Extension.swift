//
//  UILabel+Extension.swift
//  LoodosChallange
//
//  Created by MAKAN on 27.02.2021.
//

import UIKit

extension UILabel {
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor){
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : font ?? UIFont.systemFontSize
        ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
}

