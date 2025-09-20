//
//  PlayerEntity.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 20/09/25.
//

import SpriteKit
import GameplayKit
import BehindGameKit

class PlayerEntity: GKEntity {
    
    override init() {
        super.init()
        
        var node = SKSpriteNode(color: .cyan, size: .init(width: 160, height: 160))
        self.addComponent(GKSKNodeComponent(node: node))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
