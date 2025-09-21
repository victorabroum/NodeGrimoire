//
//  SpawnCrystal.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 21/09/25.
//

import SpriteKit
import GameplayKit
import BehindGameKit

class SpawnCrystalEntity: GKEntity {
    
    var position: CGPoint = .zero {
        didSet {
            self.component(ofType: GKSKNodeComponent.self)?.node.position = position
        }
    }
    
    override init() {
        super.init()
        
        let node = SKSpriteNode(color: .systemPink, size: .init(width: 16, height: 16))
        self.addComponent(GKSKNodeComponent(node: node))
        
        let body = SKPhysicsBody(rectangleOf: node.size)
        body.affectedByGravity = false
        body.categoryBitMask = .items
        body.collisionBitMask = ~(.contactWithAllCategories())
        body.contactTestBitMask = ~(.contactWithAllCategories(less:[.player]))
        self.addComponent(PhysicsBodyComponent(body: body))
        
        self.addComponent(IsCrystalComponent())
        
        let interactComp = InteractableComponent {
            GrimoireManager.shared?.open()
        }
        self.addComponent(interactComp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
