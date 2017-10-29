//
//  GameplayScene.swift
//  EthanDanaFlappyCollision
//
//  Created by Ian Porter on 10/28/17.
//  Copyright © 2017 Ethan Cohen & Dana Deering. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    
    private var background1: BGClass?;
    private var background2: BGClass?;
    private var background3: BGClass?;
    
    private var mainCamera: SKCameraNode?;
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    override func update(_ currentTime: TimeInterval) {
        manageCamera()
    }
    private func initializeGame() {
        mainCamera = childNode(withName: "mainCamera") as? SKCameraNode!;
    }
    private func manageCamera() {
        self.mainCamera?.position.x += 10;
    }
}
