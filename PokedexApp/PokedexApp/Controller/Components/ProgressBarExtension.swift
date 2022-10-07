//
//  ProgressBarExtension.swift
//  PokedexApp
//
//  Created by Larissa de Souza Lanes Goncalves on 05/10/22.
//

import Foundation
import UIKit

extension UIView {
    
    static func backgroundViewProgressBar() -> UIView {
        let backgroundProgressView = UIView()
        backgroundProgressView.layer.cornerRadius = 17
        backgroundProgressView.backgroundColor = UIColor.systemFill
        backgroundProgressView.layer.borderColor = UIColor.gray.cgColor
        backgroundProgressView.layer.borderWidth = 0.5
        backgroundProgressView.frame = CGRect(x: 10, y: 7, width: 250.0 , height: 35)

        return backgroundProgressView
    }
    
    static func viewProgressBar(width: CGFloat, color: UIColor) -> UIView {
        let progressView = UIView()
        progressView.layer.cornerRadius = 17
        progressView.backgroundColor = color
        progressView.alpha = 1.0
        progressView.frame = CGRect(x: 0.0, y: 0, width: width , height: 35)
        progressView.layer.shadowOpacity = 0.3
        
        return progressView
    }
    
    static func label(text: String, width: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 35))
            label.textAlignment = .center
            label.text = text
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 13)
            label.numberOfLines = 0
        
            return label
    }
}


