//
//  setPageThree.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 23.02.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

extension ARViewController{    
    public func setPageTwo(pokemon1: Int, pokemon2: Int){
        resetSceneView()
        setPage3_addHead(pokemonID: pokemon1)
        setPage3_addTail(pokemonID: pokemon2)
    }
}
