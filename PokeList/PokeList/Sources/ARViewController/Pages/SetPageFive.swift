//
//  SetPageFive.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 2.03.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

extension ARViewController{
    public func setPage5_addHead(pokemonID: Int){
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
                
        //Show pokemon animaton image
        runAfter(time: 2.4) {
            self.animateHeadAndTitleLabel(withText: "Hi,I am Head now!", pokemonType: pokemonType)
        }
        
        pokeballList.insertToFront(value: headPokeball!)
        pokemonList.insertToFront(value: pokemonNode)
        
        //Terminal part
        self.runAfter(time: 1, action: {
            self.insertCommandToTerminal(command: "Pokemon inserted to front (as head): \(pokemonType.rawValue)",newLine: true)
            self.insertCommandToTerminal(command: "Pokemons : \(self.pokemonList.printAll())")
            self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
        })
    }
    
    public func setPage5_addTail(pokemonID: Int){
        self.delayTime += -2
        
        runAfter(time: delayTime) {

            guard let pokemonType = PokemonType.allCases[exist: pokemonID] else { self.showInvalidPokemonIDAlert(); return }

            let actualPokemon = self.headPokeball!.pokemon as! PokemonNode

            //Its not head anymore
            self.headPokeball!.isHead = false
            self.tailPokeball = self.headPokeball
            
            let pokemonNode = PokemonNode(location: (Double(actualPokemon.location.0) - Double(spaceBetweenPokeballs + pokeballWidth),-0.1,-0.91), pokemonType: pokemonType)
            self.headPokeball = PokeballNode(location: (Double(self.headPokeball!.location.0) - Double(spaceBetweenPokeballs + pokeballWidth ) ,-0.1 ,-1 ), pokemon: pokemonNode)
            pokemonNode.pokeball = self.headPokeball!

            //Set connection pointer
            let pointerNode = Pointer(color: UIColor.orange, pointerType: PointerType.normal)
            pointerNode.position = SCNVector3(pointerPosition + Double(pokemonNode.location.0), -0.1, -0.91)

            //Move head pointer and add tail pointer
            self.runAfter(time: 3, action: {
                self.headPokeball!.isHead = true

                self.headPointer!.runAction(SCNAction.move(to: SCNVector3(self.headPokeball!.location.0 , 0.08, -0.91), duration: 1.2))
                self.headPointerPosition = (self.headPokeball!.location.0 , 0.08, -0.91)

                //Set tail pointer
                self.runAfter(time: 1, action: {
                    self.tailPointer = Pointer(color: UIColor.red, pointerType: .tail)
                    self.tailPointer!.position = SCNVector3(self.tailPokeball!.location.0, 0.08 , -0.91)
                    self.tailPointer!.location = (self.tailPokeball!.location.0, 0.08 , -0.91)
                    
                    self.tailPointerPosition = (self.tailPokeball!.location.0, 0.08 , -0.91)
                    self.tailPokeball!.isTail = true
                    self.sceneView.addToRootNode(self.tailPointer!)
                })
                
                //Show pokemon animaton image
                self.runAfter(time: 1) {
                    self.animateHeadAndTitleLabel(withText: "Hi,I am new head now!", pokemonType: pokemonType)
                }
                
            })

            //Add all to linked list's
            self.pointerList.insertToFront(value: pointerNode)
            self.pokeballList.insertToFront(value: self.headPokeball!)
            self.pokemonList.insertToFront(value: pokemonNode)

            //Add to scene
            self.sceneView.addToRootNode(pokemonNode)
            self.sceneView.addToRootNode(self.headPokeball!)
            self.sceneView.addToRootNode(pointerNode)
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon inserted to front (as tail): \(pokemonType.rawValue)",newLine: true)
                self.insertCommandToTerminal(command: "Pokemons : \(self.pokemonList.printAll())")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage5_addNormal(pokemonID: Int){
        self.delayTime += 7
        
        runAfter(time: delayTime) {
            
            guard let pokemonType = PokemonType.allCases[exist: pokemonID] else { self.showInvalidPokemonIDAlert(); return }
            
            let actualPokemon = self.headPokeball!.pokemon as! PokemonNode
            
            //Its not head anymore
            self.headPokeball!.isHead = false
            
            let pokemonNode = PokemonNode(location: (Double(actualPokemon.location.0) - Double(spaceBetweenPokeballs + pokeballWidth),-0.1,-0.91), pokemonType: pokemonType)
            self.headPokeball = PokeballNode(location: (Double(self.headPokeball!.location.0) - Double(spaceBetweenPokeballs + pokeballWidth ) ,-0.1 ,-1 ), pokemon: pokemonNode)
            pokemonNode.pokeball = self.headPokeball!
            
            //Set connection pointer
            let pointerNode = Pointer(color: UIColor.orange, pointerType: PointerType.normal)
            pointerNode.position = SCNVector3(pointerPosition + Double(pokemonNode.location.0), -0.1, -0.91)
            
            //Move head pointer and add tail pointer
            self.runAfter(time: 3, action: {
                self.headPokeball!.isHead = true
                
                self.headPointer!.runAction(SCNAction.move(to: SCNVector3(self.headPokeball!.location.0 , 0.08, -0.91), duration: 1.2))
                self.headPointerPosition = (self.headPokeball!.location.0 , 0.08, -0.91)
            })
            
            //Show pokemon animaton image
            self.runAfter(time: 2) {
                self.animateHeadAndTitleLabel(withText: "Hi,I am new Head now!", pokemonType: pokemonType)
            }
            
            //Add all to linked list's
            self.pointerList.insertToFront(value: pointerNode)
            self.pokeballList.insertToFront(value: self.headPokeball!)
            self.pokemonList.insertToFront(value: pokemonNode)
            
            //Add to scene
            self.sceneView.addToRootNode(pokemonNode)
            self.sceneView.addToRootNode(self.headPokeball!)
            self.sceneView.addToRootNode(pointerNode)
            
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon inserted to front: \(pokemonType.rawValue)",newLine: true)
                self.insertCommandToTerminal(command: "Pokemons : \(self.pokemonList.printAll())")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
}
