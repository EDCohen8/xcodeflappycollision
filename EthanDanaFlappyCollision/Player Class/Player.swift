//
//  Player.swift
//  EthanDanaFlappyCollision
//
//  Created by Ethan Cohen on 10/29/17.
//  Copyright © 2017 Ethan Cohen. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var playerAnimation = [SKTexture]();
    private var animatePlayerAction = SKAction();
    
    func initializePlayer(){
        name = "Player";
        for i in 1...2{
            let name = "swimmy\(i)";
            playerAnimation.append(SKTexture(imageNamed: name));
        }
        
        animatePlayerAction = SKAction.animate(with: playerAnimation, timePerFrame: 0.08, resize: true, restore: false);
        
        self.run(SKAction.repeatForever(animatePlayerAction)); //change this later
    }
    
}
