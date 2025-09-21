//
//  GrimoireManager.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 20/09/25.
//

import SpriteKit

class GrimoireManager {
    
    var scene: SKScene
    
    public init(scene: SKScene) {
        self.scene = scene
    }
    
    public func addChild(at node: SKNode) {
        let node = SKSpriteNode(color: .red, size: .init(width: 16, height: 16))
        scene.addChild(node)
        node.position = node.position
        node.position.x += 24
    }
    
}
