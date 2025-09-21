//
//  InteractorComponent.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 21/09/25.
//

import GameplayKit
import SpriteKit
import BehindGameKit

public class InteractorComponent: GKComponent {
    weak var interactable: InteractableComponent?
    
    public func setInteractable(_ interactable: InteractableComponent?) {
        self.interactable = interactable
    }
    
    public func interact() {
        if let interactable = interactable {
            interactable.interact()
        } else {
            print("No interaction available")
        }
    }
}
