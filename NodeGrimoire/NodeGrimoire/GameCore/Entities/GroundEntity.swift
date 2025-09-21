//
//  GroundEntity.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 20/09/25.
//

import SpriteKit
import GameplayKit
import BehindGameKit

class GroundEntity: GKEntity {
    
    override init() {
        super.init()
        
        let node = SKShapeNode(rectOf: .init(width: 1920, height: 32))
        node.fillColor = .brown
        self.addComponent(GKSKNodeComponent(node: node))
        
        let body = SKPhysicsBody(rectangleOf: node.nodeSize)
        body.categoryBitMask = .ground
        body.affectedByGravity = false
        body.isDynamic = false
        self.addComponent(PhysicsBodyComponent(body: body))
        
        self.addComponent(IsGroundComponent())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
