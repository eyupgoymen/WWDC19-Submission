//
//  PokeballNode.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 5.02.2019.
//

import UIKit
import ARKit
import SceneKit

public class PokeballNode: SCNNode {
    
    var isPokeballOpened = false
    var location: location!
    var customChildNode = SCNNode()
    var pokemon = SCNNode()
    var isHead = false
    var isTail = false
    
    private var isAnimating = false
    
    init(location: location,pokemon: PokemonNode){
        super.init()
        self.location = location
        self.pokemon = pokemon
        loadPokeballFromModel()
    }
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //This function loads the pokeball from model
    private func loadPokeballFromModel(){
        DispatchQueue.main.async {
            guard let ballScene = SCNScene(named: "Pokeball.scn") else {
                return
            }
            
            guard let ballNode = ballScene.rootNode.childNode(withName: "Ball", recursively: false) else {
                return
            }
            
            //Position the pokeball in given position
            ballNode.position = SCNVector3(0, 0, 0)
            
            self.position = SCNVector3(self.location.x, self.location.y, self.location.z)
            self.addChildNode(ballNode)
            self.customChildNode = ballNode
            
            //Add the lighting node
            let upperLightNode = self.getLightNode()
            let downLightNode = self.getLightNode()
            
            upperLightNode.position = SCNVector3(0, 0.5, 0)
            downLightNode.position = SCNVector3(0, -0.5, 0)
            
            ballNode.addChildNode(upperLightNode)
            ballNode.addChildNode(downLightNode)
        }
    }
    
    //TODO: implement audios
    public func openPokeball(){
        if !isAnimating{
            isAnimating = true
            let topSphere = customChildNode.childNode(withName: "top", recursively: true)!
            let pokemonTypeReference = pokemon as! PokemonNode
            let pokemonType = pokemonTypeReference.pokemonType
            
            topSphere.runAction(SCNAction.rotateBy(x: -1.4, y: 0, z: 0, duration: 0.3)) // open the ball
            
            pokemon.runAction(SCNAction.sequence([SCNAction.wait(duration: 0.3),SCNAction.moveBy(x: 0, y: 0.05, z: 0, duration: 0.3),SCNAction.scale(to: 1.5, duration: 0.3),SCNAction.playAudio(SCNAudioSource(named: pokemonType!.audioName)!, waitForCompletion: false)])) // show the pokemon
            isAnimating = false
            
        }
    }
    
    public func closePokeball(){
        if !isAnimating{
            isAnimating = true
            let topSphere = customChildNode.childNode(withName: "top", recursively: true)!
            
            pokemon.runAction(SCNAction.sequence([SCNAction.moveBy(x: 0, y: -0.05, z: 0, duration: 0.3),SCNAction.scale(to: 0.7, duration: 0.3)])) // remove the pokemon
            
            topSphere.runAction(SCNAction.sequence([SCNAction.wait(duration: 0.3),SCNAction.rotateBy(x: 1.4, y: 0, z: 0, duration: 0.3)])) // close the top sphere
            isAnimating = false
        }
    }
    
    private func getLightNode() -> SCNNode {
        let light = SCNLight()
        light.type = .directional
        light.intensity = 1000
        light.temperature = 5000
        
        let lightNode = SCNNode()
        lightNode.light = light
        
        return lightNode
    }
    
}
