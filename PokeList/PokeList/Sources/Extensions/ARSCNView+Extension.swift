//
//  ARSCNView+Extension.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 5.02.2019.
//

import Foundation
import ARKit

public extension ARSCNView {
    //Add given node to root node
    func addToRootNode(_ node: SCNNode){
        self.scene.rootNode.addChildNode(node)
    }
}

public extension SCNVector3{
    
    // Sum of two vectors
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    //Substract
    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3Make(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    
    //Length of vector
    func length() -> Float {
        return sqrtf(x*x + y*y + z*z)
    }
    
    //Distance between two vectors
    func distance(vector: SCNVector3) -> Float {
        return (self - vector).length()
    }
}
