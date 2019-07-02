//
//  SetPageThree.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 23.02.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

extension ARViewController{
    public func setPage3_addHead(pokemonID: Int){
        resetSceneView()
        showLoader()
        
        //Set pokeballs
        guard let pokemonType = PokemonType.allCases[exist: pokemonID] else { showInvalidPokemonIDAlert(); return }
        let pokemonNode = PokemonNode(location: (-0.4, -0.1, -0.91), pokemonType: pokemonType)
        headPokeball = PokeballNode(location: (-0.4 ,-0.1 ,-1), pokemon: pokemonNode)
        pokemonNode.pokeball = headPokeball!
        
        //Set head pointer
        self.headPointer = Pointer(color: UIColor.blue, pointerType: .head)
        self.headPointer!.position = SCNVector3(headPokeball!.location.0, 0.08 , -0.91)
        self.headPointer!.location = (headPokeball!.location.0, 0.08 , -0.91)
        
        headPointerPosition = (headPokeball!.location.0, 0.08 , -0.91)
        headPokeball!.isHead = true
        
        //Add to scene
        sceneView.addToRootNode(pokemonNode)
        sceneView.addToRootNode(headPokeball!)
        sceneView.addToRootNode(headPointer!)
        
        pokeballList.insertToEnd(value: headPokeball!)
        pokemonList.insertToEnd(value: pokemonNode)
                
        //Show pokemon animaton image
        runAfter(time: 2.4) {
            self.animateHeadAndTitleLabel(withText: "Hi,I am Head now!", pokemonType: pokemonType)
        }

        //Terminal part
        self.runAfter(time: 1, action: {
            self.insertCommandToTerminal(command: "Pokemon inserted to end (as head): \(pokemonType.rawValue)",newLine: true)
            self.insertCommandToTerminal(command: "Pokemons : \(self.pokemonList.printAll())")
            self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
        })
    }
    
    public func setPage3_addTail(pokemonID: Int){
        runAfter(time: 6) {
            //Set pokeballs
            let actualPokemon = self.headPokeball!.pokemon as! PokemonNode
            
            guard let pokemonType = PokemonType.allCases[exist: pokemonID] else { self.showInvalidPokemonIDAlert(); return }
            let pokemonNode = PokemonNode(location: (spaceBetweenPokeballs + pokeballWidth + Double(actualPokemon.location.0), -0.1, -0.91), pokemonType: pokemonType)
            self.tailPokeball = PokeballNode(location: (spaceBetweenPokeballs + pokeballWidth + Double(self.headPokeball!.location.0) ,-0.1 ,-1 ), pokemon: pokemonNode)
            pokemonNode.pokeball = self.tailPokeball!
            
            //Set tail pointer
            self.tailPointer = Pointer(color: UIColor.red, pointerType: .tail)
            self.tailPointer!.position = SCNVector3(self.tailPokeball!.location.0, 0.08 , -0.91)
            self.tailPointer!.location = (self.tailPokeball!.location.0, 0.08 , -0.91)
            
            self.tailPointerPosition = (self.tailPokeball!.location.0, 0.08 , -0.91)
            self.tailPokeball!.isTail = true
            
            //Set connection pointer
            let pointerNode = Pointer(color: UIColor.orange, pointerType: PointerType.normal)
            pointerNode.position = SCNVector3(pointerPosition + Double(actualPokemon.location.0), -0.1, -0.91)
            
            //Add to scene
            self.sceneView.addToRootNode(pokemonNode)
            self.sceneView.addToRootNode(self.tailPokeball!)
            self.sceneView.addToRootNode(self.tailPointer!)
            self.sceneView.addToRootNode(pointerNode)
            
            //Show pokemon animaton image
            self.runAfter(time: 2) {
                self.animateHeadAndTitleLabel(withText: "Hi,I am Tail now!", pokemonType: pokemonType)
            }
            
            self.pokeballList.insertToEnd(value: self.tailPokeball!)
            self.pokemonList.insertToEnd(value: pokemonNode)
            self.pointerList.insertToEnd(value: pointerNode)
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon inserted to end (as tail): \(pokemonType.rawValue)",newLine: true)
                self.insertCommandToTerminal(command: "Pokemons : \(self.pokemonList.printAll())")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage3_addNormal(pokemonID: Int){
        self.delayTime += 5
        runAfter(time: delayTime) {
            //Set pokeballs
            let actualPokemon = self.tailPokeball!.pokemon as! PokemonNode
            self.tailPokeball!.isTail = false // last pokemon is not tail anymore
            
            guard let pokemonType = PokemonType.allCases[exist: pokemonID] else { self.showInvalidPokemonIDAlert(); return }
            let pokemonNode = PokemonNode(location: (spaceBetweenPokeballs + pokeballWidth + Double(actualPokemon.location.0), -0.1, -0.91), pokemonType: pokemonType)
            self.tailPokeball = PokeballNode(location: (spaceBetweenPokeballs + pokeballWidth + Double(self.tailPokeball!.location.0) ,-0.1 ,-1 ), pokemon: pokemonNode)
            pokemonNode.pokeball = self.tailPokeball!
            
            //Move tail pointer
            self.runAfter(time: 3, action: {
                self.tailPokeball!.isTail = true
                self.tailPointer!.runAction(SCNAction.move(to: SCNVector3(self.tailPokeball!.location.0 , 0.08, -0.91), duration: 1.2))
                self.tailPointerPosition = (self.tailPokeball!.location.0 , 0.08, -0.91)
            })
            
            //Set connection pointer
            let pointerNode = Pointer(color: UIColor.orange, pointerType: PointerType.normal)
            pointerNode.position = SCNVector3(pointerPosition + Double(actualPokemon.location.0), -0.1, -0.91)
            
            //Add to scene
            self.sceneView.addToRootNode(pokemonNode)
            self.sceneView.addToRootNode(self.tailPokeball!)
            self.sceneView.addToRootNode(pointerNode)
            
            //Show pokemon animaton image
            self.runAfter(time: 3) {
                self.animateHeadAndTitleLabel(withText: "Hi,I am new Tail!", pokemonType: pokemonType)
            }
            
            self.pokeballList.insertToEnd(value: self.tailPokeball!)
            self.pokemonList.insertToEnd(value: pokemonNode)
            self.pointerList.insertToEnd(value: pointerNode)
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon inserted to end: \(pokemonType.rawValue)",newLine: true)
                self.insertCommandToTerminal(command: "Pokemons : \(self.pokemonList.printAll())")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    
}
