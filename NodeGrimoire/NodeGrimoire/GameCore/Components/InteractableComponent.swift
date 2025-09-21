//
//  InteractableComponent.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 21/09/25.
//

import SpriteKit
import GameplayKit
import BehindGameKit

public class InteractableComponent: GKComponent {
    public var interact: () -> Void
    
    init(interact: @escaping () -> Void) {
        self.interact = interact
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
