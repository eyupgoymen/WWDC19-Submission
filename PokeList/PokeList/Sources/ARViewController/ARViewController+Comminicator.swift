//
//  ARViewController+Comminicator.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 2.03.2019.
//

import Foundation
import UIKit
import PlaygroundSupport
import ARKit
import SceneKit

extension ARViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        switch message{
        case let .dictionary(dictionary):
            guard case let .string(command)? = dictionary["Command"] else {
                return
            }
            
            switch command{
            case "Page1/loadScene":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPageOne(pokemonID: pokemonID)
                
            case "Page2/loadScene":
                guard case let .integer(pokemonID_1)? = dictionary["pokemonID_1"] else {
                    return
                }
                
                guard case let .integer(pokemonID_2)? = dictionary["pokemonID_2"] else {
                    return
                }
                setPageTwo(pokemon1: pokemonID_1, pokemon2: pokemonID_2)
                
            case "Page3/addHead":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPage3_addHead(pokemonID: pokemonID)
                
            case "Page3/addTail":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPage3_addTail(pokemonID: pokemonID)
                
            case "Page3/addNormal":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPage3_addNormal(pokemonID: pokemonID)
                
                
            case "Page4/remove":
                setPage4_remove()
                
            case "Page4/alert":
                setPage4_alert()
                
            case "Page4/removeHead":
                setPage4_removeHead()
                
            case "Page4/removeTail":
                setPage4_removeTail()
                
            case "Page5/addNormal":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPage5_addNormal(pokemonID: pokemonID)
                
            case "Page5/addHead":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPage5_addHead(pokemonID: pokemonID)
               
            case "Page5/addTail":
                guard case let .integer(pokemonID)? = dictionary["pokemonID"] else {
                    return
                }
                setPage5_addTail(pokemonID: pokemonID)
                
            case "Page6/remove":
                setPage6_remove()
                
            case "Page6/removeHead":
                setPage6_removeHead()
                
            case "Page6/removeTail":
                setPage6_removeTail()
                
            case "Test":
                alert(message: "Test is live", title: "Test")
                
            default:
                return
            }
        default:
            return
        }
    }
}
