//
//  ARViewController+HitTest.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 15.02.2019.
//

import UIKit
import ARKit
import SceneKit

extension ARViewController{
    @objc
    func pokeballTapped(recognizer: UIGestureRecognizer){
        let location = recognizer.location(in: sceneView)
        let hitTest = self.sceneView.hitTest(location, options: nil)
        
        guard let pokeBallnode = hitTest.first?.node else {
            return
        }
        
        let ballNode = pokeBallnode.parent! // the ball parent
    
        //Pokeball pressed
        if let customPokeballNode = ballNode.parent as? PokeballNode {
            switch !customPokeballNode.isPokeballOpened {
            case true:
                if customPokeballNode.isHead{ // open head
                    headPointer!.runAction(SCNAction.move(to: SCNVector3(headPointerPosition.x, 0.18 , -0.91), duration: 0.5))
                }
                
                if customPokeballNode.isTail{ // open tail
                    tailPointer!.runAction(SCNAction.move(to: SCNVector3(tailPointerPosition.x, 0.18 , -0.91), duration: 0.5))
                }
                
                customPokeballNode.openPokeball()
            case false:
                if customPokeballNode.isHead{ // close head
                    headPointer!.runAction(SCNAction.move(to: SCNVector3(headPointerPosition.x, 0.08 , -0.91), duration: 0.5))
                }
                
                if customPokeballNode.isTail { // close tail
                    tailPointer!.runAction(SCNAction.move(to: SCNVector3(tailPointerPosition.x, 0.08 , -0.91), duration: 0.5))
                }
                
                customPokeballNode.closePokeball()
            }
            
            customPokeballNode.isPokeballOpened.toggle()
            return
        }
        
        //Pokemon pressed
        if let ballNodeOfPokemon = pokeBallnode.parent as? PokemonNode{
            let customPokeballNode = ballNodeOfPokemon.pokeball
            switch !ballNodeOfPokemon.pokeball.isPokeballOpened {
            case true:
                if customPokeballNode.isHead{ // open head
                    headPointer!.runAction(SCNAction.move(to: SCNVector3(headPointerPosition.x, 0.18 , -0.91), duration: 0.5))
                }
                
                if customPokeballNode.isTail{ // open tail
                    tailPointer!.runAction(SCNAction.move(to: SCNVector3(tailPointerPosition.x, 0.18 , -0.91), duration: 0.5))
                }
                
                ballNodeOfPokemon.pokeball.openPokeball()
            case false:
                if customPokeballNode.isHead{ // close head
                    headPointer!.runAction(SCNAction.move(to: SCNVector3(headPointerPosition.x, 0.08 , -0.91), duration: 0.5))
                }
                
                if customPokeballNode.isTail { // close tail
                    tailPointer!.runAction(SCNAction.move(to: SCNVector3(tailPointerPosition.x, 0.08 , -0.91), duration: 0.5))
                }
                
                ballNodeOfPokemon.pokeball.closePokeball()
            }
            ballNodeOfPokemon.pokeball.isPokeballOpened.toggle()
        }
    }  
}
