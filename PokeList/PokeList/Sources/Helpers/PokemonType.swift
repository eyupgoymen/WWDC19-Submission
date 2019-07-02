//
//  PokemonType.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 5.02.2019.
//

import Foundation

public enum PokemonType: String,CaseIterable{
    case Pikachu
    case Bulbasaur
    case Charmander
    case Squirtle
    
    var audioName: String{
        switch self {
            case .Pikachu:
                return "Pikachu.mp3"
            case .Bulbasaur:
                return "Bulbasaur.mp3"
            case .Charmander:
                return "Charmander.mp3"
            case .Squirtle:
                return "Squirtle.mp3"
        }
    }
    
    var imageName: String{
        switch self {
        case .Pikachu:
            return "Pikachu"
        case .Bulbasaur:
            return "Bulbasaur"
        case .Charmander:
            return "Charmander"
        case .Squirtle:
            return "Squirtle"
        }
    }
}

