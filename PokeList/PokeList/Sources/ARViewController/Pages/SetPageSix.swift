//
//  SetPageSix.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 28.04.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

extension ARViewController{
    public func setPage6_removeHead(){
        self.delayTime += 5
        runAfter(time: delayTime) {
            let (pokeball,_) = self.pokeballList.removeFromFront()
            let (pokemon,_) = self.pokemonList.removeFromFront()
            
            pokeball!.value.removeFromParentNode()
            pokemon!.value.removeFromParentNode()
            
            pokeball!.value.isHead = false
            
            self.headPointer!.removeFromParentNode()
            self.headPointer = nil
            self.headPokeball = nil
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon deleted from front(head): \(pokemon!.value.pokemonType.rawValue)",newLine: true)
                let pokemons = self.pokemonList.printAll()
                self.insertCommandToTerminal(command: "Pokemons : \(pokemons == "" ? "Pokelist empty!" : pokemons)")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage6_removeTail(){
        self.delayTime += 8
        runAfter(time: delayTime) {
            let (pointer,_) = self.pointerList.removeFromFront()
            let (pokeball,_) = self.pokeballList.removeFromFront()
            let (pokemon,nextPokemon) = self.pokemonList.removeFromFront()
            
            pointer!.value.removeFromParentNode()
            pokeball!.value.removeFromParentNode()
            pokemon!.value.removeFromParentNode()
            
            self.tailPointer?.removeFromParentNode()
            self.tailPointer = nil
            self.tailPokeball = nil
            
            //Move header
            self.runAfter(time: 1, action: {
                self.headPointer!.runAction(SCNAction.move(to: SCNVector3(self.tailPointerPosition.0 , 0.08, -0.91), duration: 1.2))
            })
            
            //Show pokemon animaton image
            self.runAfter(time: 3) {
                self.animateHeadAndTitleLabel(withText: "Hi,I am new Head now!", pokemonType: nextPokemon!.value.pokemonType)
            }
            
            //Terminal part
            self.runAfter(time: 2, action: {
                self.insertCommandToTerminal(command: "Pokemon deleted from front(tail): \(pokemon!.value.pokemonType.rawValue)",newLine: true)
                let pokemons = self.pokemonList.printAll()
                self.insertCommandToTerminal(command: "Pokemons : \(pokemons == "" ? "Pokelist empty!" : pokemons)")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage6_remove(){
        self.delayTime += 8
        runAfter(time: delayTime) {
            let (pointer, _) = self.pointerList.removeFromFront()
            let (pokeball,nextPokeball) = self.pokeballList.removeFromFront()
            let (pokemon,nextPokemon) = self.pokemonList.removeFromFront()
            
            pointer!.value.removeFromParentNode()
            pokeball!.value.removeFromParentNode()
            pokemon!.value.removeFromParentNode()
            
            nextPokeball?.value.isHead = true
            self.headPokeball = nextPokeball?.value
            
            self.headPointerPosition = location(nextPokeball!.value.location.0, 0.08, -0.91)
            
            self.runAfter(time: 1, action: {
                self.headPointer!.runAction(SCNAction.move(to: SCNVector3(self.headPointerPosition.0 , 0.08, -0.91), duration: 1.2))
            })
            
            //Show pokemon animaton image
            self.runAfter(time: 3) {
                self.animateHeadAndTitleLabel(withText: "Hi,I am new Head now!", pokemonType: nextPokemon!.value.pokemonType)
            }
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon deleted from front: \(pokemon!.value.pokemonType.rawValue)",newLine: true)
                let pokemons = self.pokemonList.printAll()
                self.insertCommandToTerminal(command: "Pokemons : \(pokemons == "" ? "Pokelist empty!" : pokemons)")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
}
