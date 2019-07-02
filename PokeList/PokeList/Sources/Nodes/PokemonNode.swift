//
//  PokemonNode.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 5.02.2019.
//

import UIKit
import ARKit
import SceneKit

public class PokemonNode: SCNNode{
    
    var location: location!
    var pokemonType: PokemonType!
    var customChildNode = SCNNode()
    var pokeball = PokeballNode()
    
    init(location: location, pokemonType: PokemonType){
        super.init()
        self.location = location
        self.pokemonType = pokemonType
        loadPokemanFromModel()
    }
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadPokemanFromModel(){
        DispatchQueue.main.async {
            guard let pokemonScene = SCNScene(named: "\(self.pokemonType.rawValue).scn") else {
                return
            }
            
            guard let pokemonNode = pokemonScene.rootNode.childNode(withName: "Pokemon", recursively: false) else {
                return
            }
            
            pokemonNode.position = SCNVector3(0,0,0)
            
            pokemonNode.name = "Poke"
            self.position = SCNVector3(self.location.x, self.location.y, self.location.z)
            self.addChildNode(pokemonNode)
            self.customChildNode = pokemonNode
        }
    }
}
