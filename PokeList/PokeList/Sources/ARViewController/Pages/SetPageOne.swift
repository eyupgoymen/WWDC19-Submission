//
//  Page1.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 23.02.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

extension ARViewController{
    public func setPageOne(pokemonID: Int){
        resetSceneView()
        showLoader()

        let pokemonType = PokemonType.allCases[pokemonID]
        let pokemonNode = PokemonNode(location: (0, 0, -0.91), pokemonType: pokemonType)
        let pokeballNode = PokeballNode(location: (0 ,0 ,-1 ), pokemon: pokemonNode)
        
        pokemonNode.pokeball = pokeballNode
        
        self.sceneView.addToRootNode(pokeballNode)
        self.sceneView.addToRootNode(pokemonNode)
        self.insertCommandToTerminal(command: "Welcome to pokelist...")
        
        //Terminal part
        runAfter(time: 1.5) {
            self.animateHeadAndTitleLabel(withText: "Hi, Welcome to PokeList.", pokemonType: pokemonType)
            
            self.runAfter(time: 0.2, action: {
                self.insertCommandToTerminal(command: "Pokemon inserted: \(pokemonType.rawValue)")
            })
        }
    }
}
