//
//  SetPage4.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 1.03.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

extension ARViewController{
    
    public func setPage4_removeHead(){
        self.delayTime += 8
        runAfter(time: delayTime) {
            let (pokeball,_) = self.pokeballList.removeFromEnd()
            let (pokemon,_) = self.pokemonList.removeFromEnd()
            
            pokeball!.value.removeFromParentNode()
            pokemon!.value.removeFromParentNode()
            
            pokeball!.value.isHead = false
            self.headPointer!.removeFromParentNode()
            self.headPointer = nil
            self.headPokeball = nil
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon deleted from last(head): \(pokemon!.value.pokemonType.rawValue)",newLine: true)
                let pokemons = self.pokemonList.printAll()
                self.insertCommandToTerminal(command: "Pokemons : \(pokemons == "" ? "Pokelist empty!" : pokemons)")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage4_removeTail(){
        self.delayTime += 8
        runAfter(time: delayTime) {
            let (pointer,_) = self.pointerList.removeFromEnd()
            let (pokeball,_) = self.pokeballList.removeFromEnd()
            let (pokemon,_) = self.pokemonList.removeFromEnd()
            
            pointer!.value.removeFromParentNode()
            pokeball!.value.removeFromParentNode()
            pokemon!.value.removeFromParentNode()
            
            self.tailPointer!.removeFromParentNode()
            self.tailPointer = nil
            self.tailPokeball = nil
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon deleted from last (tail): \(pokemon!.value.pokemonType.rawValue)",newLine: true)
                let pokemons = self.pokemonList.printAll()
                self.insertCommandToTerminal(command: "Pokemons : \(pokemons == "" ? "Pokelist empty!" : pokemons)")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage4_remove(){
        self.delayTime += 8
        runAfter(time: delayTime) {
            let (pointer,_) = self.pointerList.removeFromEnd()
            let (pokeball,previous) = self.pokeballList.removeFromEnd()
            let (pokemon,previousPokemon) = self.pokemonList.removeFromEnd()
            
            pointer!.value.removeFromParentNode()
            pokeball!.value.removeFromParentNode()
            pokemon!.value.removeFromParentNode()

            previous!.value.isTail = true
            self.tailPokeball = previous?.value
            
            self.tailPointerPosition = location(previous!.value.location.0, 0.08, -0.91)
            
            self.runAfter(time: 1, action: {
                self.tailPointer!.runAction(SCNAction.move(to: SCNVector3(self.tailPointerPosition.0 , 0.08, -0.91), duration: 1.2))
            })
            
            //Show pokemon animaton image
            self.runAfter(time: 3) {
                self.animateHeadAndTitleLabel(withText: "Hi,I am new Tail now!", pokemonType: previousPokemon!.value.pokemonType)
            }
            
            //Terminal part
            self.runAfter(time: 1, action: {
                self.insertCommandToTerminal(command: "Pokemon deleted from last: \(pokemon!.value.pokemonType.rawValue)",newLine: true)
                let pokemons = self.pokemonList.printAll()
                self.insertCommandToTerminal(command: "Pokemons : \(pokemons == "" ? "Pokelist empty!" : pokemons)")
                self.insertCommandToTerminal(command: "\(self.pokemonList.printHeadAndTail())")
            })
        }
    }
    
    public func setPage4_alert(){
        self.delayTime += 5
        runAfter(time: delayTime) {
            self.alert(message: "PokeList is empty now!", title: "Be Careful!")
            
            self.insertCommandToTerminal(command: "\nLog message: PokeList is empty now! Invalid remove attemp!")
        }
    }
}
