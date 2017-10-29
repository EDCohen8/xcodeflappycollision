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
    
    private var sand1: GroundClass?;
    private var sand2: GroundClass?;
    private var sand3: GroundClass?;
    
    private var mainCamera: SKCameraNode?;
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    override func update(_ currentTime: TimeInterval) {
        manageCamera();
        manageBGsAndGrounds();
    }
    private func initializeGame() {
        mainCamera = childNode(withName: "mainCamera") as? SKCameraNode!;
        
        background1 = childNode(withName: "background1") as? BGClass!;
        background2 = childNode(withName: "background2") as? BGClass!;
        background3 = childNode(withName: "background3") as? BGClass!;
        
        sand1 = childNode(withName: "sand1") as? GroundClass!;
        sand2 = childNode(withName: "sand2") as? GroundClass!;
        sand3 = childNode(withName: "sand3") as? GroundClass!;
    }
    private func manageCamera() {
        self.mainCamera?.position.x += 10;
    }
    
    private func manageBGsAndGrounds(){
        background1?.moveBG(camera: mainCamera!);
        background2?.moveBG(camera: mainCamera!);
        background3?.moveBG(camera: mainCamera!);
        sand1?.moveGround(camera: mainCamera!);
        sand2?.moveGround(camera: mainCamera!);
        sand3?.moveGround(camera: mainCamera!);
    }
}
