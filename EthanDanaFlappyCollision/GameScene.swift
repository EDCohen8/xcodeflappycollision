//
//  GameScene.swift
//  EthanDanaFlappyCollision
//
//  Created by Ethan Cohen on 10/28/17.
//  Copyright © 2017 Ethan Cohen. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ground = SKSpriteNode()
    var background = SKSpriteNode()
    var trash1 = SKSpriteNode()
    var trash2 = SKSpriteNode()
    var trash3 = SKSpriteNode()
    var trashArray: [SKSpriteNode] = []
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.6, y: 0.6)
        createGround()
        createBackground()
    }
    
    func createBackground() {
        for i in 0...3 {
            let background = SKSpriteNode(imageNamed: "background_static")
            background.name = "Background"
            background.size = CGSize(width: (self.scene?.size.width)!, height:250)
            background.anchorPoint = CGPoint(x: 0.6, y: 0.6)
            background.position = CGPoint (x: CGFloat(i) * background.size.width, y: -(self.frame.size.height / 2))
            self.addChild(background)
        }
    }
    
    func createTrash1(){
        for i in 0...3 {
            let trash1 = SKSpriteNode(imageNamed: "trash1")
            trash1.name = "trash1"
            trash1.size = CGSize(width: (self.scene?.size.width)!, height:250)
            trash1.anchorPoint = CGPoint(x: 1, y: 1)
            trash1.position = CGPoint (x: CGFloat(i) * trash1.size.width, y: -(self.frame.size.height / 2))
            self.addChild(trash1)
        }
    }
    
    
    func createGround() {
        for i in 0...3 {
            let ground = SKSpriteNode(imageNamed: "ground")
            ground.name = "Ground"
            ground.size = CGSize(width: (self.scene?.size.width)!, height: 250)
            ground.anchorPoint = CGPoint(x:  0.6, y: 0.6)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 2))
            self.addChild(ground)
        }
    }
    func moveGrounds(){
        self.enumerateChildNodes(withName: "Ground") { (node, error) in
            node.position.x -= 4
            
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 3
            }
        }
    }
    /*
    func moveTrash(arr: []) {
        for i in arr {
            self.enumerateChildNodes(withName: <#T##String#>, using: <#T##(SKNode, UnsafeMutablePointer<ObjCBool>) -> Void#>)
        }
    }
     */
    func randomSprite() -> SKSpriteNode {
        let array = [
            SKSpriteNode(imageNamed: "trash1"),
            SKSpriteNode(imageNamed: "trash2"),
            SKSpriteNode(imageNamed: "trash3"),
        ]
        return array[Int(arc4random_uniform(UInt32(array.count)))]
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        moveGrounds()
    }
}
