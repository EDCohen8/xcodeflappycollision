//
//  BGClass.swift
//  EthanDanaFlappyCollision
//
//  Created by **** on 10/28/17.
//  Copyright © 2017 Ethan Cohen. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode {
    func moveBG(camera: SKCameraNode) {
        if (self.position.x+self.size.width < camera.position.x) {
            self.position.x += self.size.width * 3
        }
    }
}
