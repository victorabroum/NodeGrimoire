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
    
    private var jumpComp: JumpComponent? {
        return self.component(ofType: JumpComponent.self)
    }
    
    private var interactor: InteractorComponent? {
        return self.component(ofType: InteractorComponent.self)
    }
    
    override init() {
        super.init()
        
        let node = SKSpriteNode(color: .cyan, size: .init(width: 16, height: 16))
        self.addComponent(GKSKNodeComponent(node: node))
        
        
        let body = SKPhysicsBody(rectangleOf: node.size)
        body.categoryBitMask = .player
        body.collisionBitMask = .contactWithAllCategories(less: [.items])
        body.contactTestBitMask = ~(.contactWithAllCategories(less:[.items]))
        self.addComponent(PhysicsBodyComponent(body: body))
        
        self.addComponent(ControlableComponent(delegate: self))
        self.addComponent(HorizontalMovementComponent(speed: 1, maxSpeed: 3))
        
        let jumpComp = JumpComponent(jumpForce: 5.5)
        self.addComponent(jumpComp)
        
        self.addComponent(IsPlayerComponent())
        
        self.addComponent(InteractorComponent())
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
        jumpComp?.tryJump()
    }
    
    func handleButtonBPressed() {
        interactor?.interact()
    }
}
