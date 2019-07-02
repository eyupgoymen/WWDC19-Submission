//
//  UILabel+Extension.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 14.02.2019.
//

import UIKit

public extension UILabel {
    func animate(newText: String, characterDelay: TimeInterval) {
        DispatchQueue.main.async {
            
            self.text = ""
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }
}
