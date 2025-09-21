//
//  SandboxScene+ContactHandler.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 21/09/25.
//

import SpriteKit
import GameplayKit
import BehindGameKit

extension SandboxScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity,
        let entityB = contact.bodyB.node?.entity else { return }
        
        contactWithCrystal(entityA, player: entityB)
        contactWithCrystal(entityB, player: entityA)
    }
    
    func contactWithCrystal(_ crystal: GKEntity, player: GKEntity) {
        guard crystal.component(ofType: IsCrystalComponent.self) != nil else { return }
        guard player.component(ofType: IsPlayerComponent.self) != nil else { return }
        
        let crystalInteraction = crystal.component(ofType: InteractableComponent.self)
        player.component(ofType: InteractorComponent.self)?.setInteractable(crystalInteraction)
    }

    func didEnd(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity,
        let entityB = contact.bodyB.node?.entity else { return }
        
        removeContactWithCrystal(entityA, player: entityB)
        removeContactWithCrystal(entityB, player: entityA)
    }
    
    func removeContactWithCrystal(_ crystal: GKEntity, player: GKEntity) {
        guard crystal.component(ofType: IsCrystalComponent.self) != nil else { return }
        guard player.component(ofType: IsPlayerComponent.self) != nil else { return }
        
        player.component(ofType: InteractorComponent.self)?.setInteractable(nil)
    }
}
