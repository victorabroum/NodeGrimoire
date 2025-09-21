//
//  GrimoireNode.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 20/09/25.
//

import SpriteKit

public class GrimoireNode: SKNode {
    
    var sprite: SKSpriteNode
    
    public override init() {
        sprite = SKSpriteNode(color: .gray, size: .init(width: 1920/2, height: 1080/2))
        super.init()
        
        self.addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
