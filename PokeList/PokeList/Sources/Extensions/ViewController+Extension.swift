//
//  ViewController+Extension.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 3.02.2019.
//

import Foundation
import UIKit
import ARKit

extension UIViewController {
    //Show alert function
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showInvalidPokemonIDAlert(){
        let alertController = UIAlertController(title: "Invalid Pokemon Id", message: "You should use 0 for pikachu, 1 for bulbasaur, 2 for charmander, 3 for squirtle.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIView {
    func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
