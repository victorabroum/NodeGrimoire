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
    
    private var moveComp: HorizontalMovementComponent? {
        return self.component(ofType: HorizontalMovementComponent.self)
    }
    
    override init() {
        super.init()
        
        let node = SKSpriteNode(color: .cyan, size: .init(width: 160, height: 160))
        self.addComponent(GKSKNodeComponent(node: node))
        
        self.addComponent(ControlableComponent(delegate: self))
        self.addComponent(HorizontalMovementComponent())
    }
    
    public func setupControl(inputHandler: InputHandler, virtualController: VirtualController?) {
        self.component(ofType: ControlableComponent.self)?.setupController(inputHandler: inputHandler, virtualController: virtualController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlayerEntity: ControlableDelegate {
    func handleMovement(direction: CGPoint) {
        moveComp?.change(direction: direction)
    }
    
    func handleButtonAPressed() {
        print("A pressd")
    }
}
