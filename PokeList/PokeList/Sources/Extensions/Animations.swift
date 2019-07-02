//
//  Animations.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 14.02.2019.
//

import UIKit

public extension UIView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}

public extension ARViewController{
    func animateHeadAndTitleLabel(withText: String, pokemonType: PokemonType){
        pokemonImageView.shake()
        pokemonImageView.image = UIImage(named: pokemonType.imageName)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.pokemonImageView.alpha = 1
            self.bubbleImageView.alpha = 1
            self.headLabel.alpha = 1
        }) { (_) in
            self.headLabel.animate(newText: withText, characterDelay: 0.06)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.5, animations: {
                self.pokemonImageView.alpha = 0
                self.bubbleImageView.alpha = 0
                self.headLabel.alpha = 0
                self.headLabel.text = ""
            })
        }
    }
}
