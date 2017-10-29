//
//  GroundClass.swift
//  EthanDanaFlappyCollision
//
//  Created by Ethan Cohen on 10/28/17.
//  Copyright © 2017 Ethan Cohen. All rights reserved.
//

import SpriteKit

class GroundClass: SKSpriteNode {
    func moveGround(camera: SKCameraNode) {
        if (self.position.x+self.size.width < camera.position.x) {
            self.position.x += self.size.width * 3
        }
    }
}
