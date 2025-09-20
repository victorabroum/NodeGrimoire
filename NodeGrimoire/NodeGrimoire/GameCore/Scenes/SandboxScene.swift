//
//  SandboxScene.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 20/09/25.
//

import SpriteKit
import BehindGameKit

class SandboxScene: SKGameScene {
    public static func create(withSize size: CGSize = .init(width: 1920, height: 1080)) -> SandboxScene {
        let scene = SandboxScene(size: size)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = .centered
        return scene
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        setupScene()
        self.inputHandler.observeKeyboardInputs()
    }
    
    private func setupScene() {
        let playerEntity = PlayerEntity()
        SKEntityManager.shared.add(playerEntity)
        playerEntity.setupControl(inputHandler: inputHandler, virtualController: virtualController)
    }
}
