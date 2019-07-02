//
//  Pointer.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 8.02.2019.
//
import UIKit
import ARKit
import SceneKit

public final class Pointer: SCNNode {
    var color: UIColor!
    var pointerType: PointerType!
    var location: location = (x:0,y:0,z:0)
    
    init(color: UIColor,pointerType: PointerType){
        super.init()
        self.color = color
        self.pointerType = pointerType
        
        switch pointerType {
            case .head:
                setHeadAndTailPointer()
            case .normal:
                setDefaultPointer()
            case .tail:
                setHeadAndTailPointer()
        }
    }
    
    public override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setDefaultPointer(){
        let rectangle = SCNBox(width: 0.10, height: 0.01, length: 0.01, chamferRadius: 0)
        let rectangleNode = SCNNode(geometry: rectangle)

        let triangle = SCNPyramid(width: 0.03, height: 0.03, length: 0.03)
        let triangleNode = SCNNode(geometry: triangle)

        rectangle.firstMaterial?.diffuse.contents = color
        triangle.firstMaterial?.diffuse.contents = color

        triangleNode.eulerAngles.z = GLKMathDegreesToRadians(-90)

        rectangleNode.addChildNode(triangleNode)
        triangleNode.position = SCNVector3(0.05, 0, 0)
        self.addChildNode(rectangleNode)
    }

    private func setHeadAndTailPointer(){
        let rectangle = SCNBox(width: 0.01, height: 0.1, length: 0.01, chamferRadius: 0)
        let rectangleNode = SCNNode(geometry: rectangle)

        let triangle = SCNPyramid(width: 0.03, height: 0.03, length: 0.03)
        let triangleNode = SCNNode(geometry: triangle)

        rectangle.firstMaterial?.diffuse.contents = color
        triangle.firstMaterial?.diffuse.contents = color

        triangleNode.eulerAngles.z = GLKMathDegreesToRadians(-180)
        
        let text = SCNText(string: pointerType.rawValue, extrusionDepth: 0.1)
        text.firstMaterial?.diffuse.contents = color
        text.font = UIFont.systemFont(ofSize: 4, weight: .bold)
        
        let textNode = SCNNode(geometry: text)
        rectangleNode.addChildNode(triangleNode)
        textNode.scale = SCNVector3(0.01,0.01,0.01)
        
        triangleNode.position = SCNVector3(0, -0.05, 0)
        textNode.position = SCNVector3(-0.05, 0.05, 0)
        self.addChildNode(textNode)
        self.addChildNode(rectangleNode)
    }
}
