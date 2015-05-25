//
//  GameScene.swift
//  Test
//
//  Created by Saul Moreno Abril on 18/5/15.
//  Copyright (c) 2015 Saul Moreno Abril. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {

        self.backgroundColor = UIColor.blackColor()
        
        var frame = self.frame;
        var _W:CGFloat = frame.size.width;
        var _H:CGFloat = frame.size.height;
        var _w:CGFloat = frame.size.width * 0.5;
        var _h:CGFloat = frame.size.height * 0.5;
        
        var playground = SKSpriteNode()
        playground.position = CGPoint(x: _w,y: _h);
        //Limit Up,Down,Left,Right
        playground.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRectMake(-_w, -_h , _W, _H))
        playground.physicsBody!.dynamic = false;
        playground.physicsBody!.mass = 10.0
        playground.physicsBody!.restitution = 1.0;
        playground.physicsBody!.friction = 0.0;
        playground.physicsBody!.linearDamping = 0.0;
        playground.physicsBody!.categoryBitMask = 0b001
        playground.physicsBody!.collisionBitMask = 0xFFFFFFFF
        playground.physicsBody!.contactTestBitMask = 0;
        self.addChild(playground)
        
        var blueBall = SKShapeNode(circleOfRadius: 50)
        blueBall.name = "BlueBall"
        blueBall.position = CGPointMake(_w - 100, _h)
        blueBall.strokeColor = UIColor.whiteColor()
        blueBall.glowWidth = 2.0
        blueBall.fillColor = UIColor.blueColor()
        self.addChild(blueBall)
        
        
        var redBall = SKShapeNode(circleOfRadius: 50)
        redBall.name = "RedBall"
        redBall.position = CGPointMake(_w + 100, _h)
        redBall.strokeColor = UIColor.whiteColor()
        redBall.glowWidth = 2.0
        redBall.fillColor = UIColor.redColor()
        self.addChild(redBall)
        
        blueBall.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        blueBall.physicsBody!.dynamic = true;
        blueBall.physicsBody!.mass = 0.1
        blueBall.physicsBody!.restitution = 1.0;
        blueBall.physicsBody!.friction = 0.0;
        blueBall.physicsBody!.linearDamping = 0.0;
        blueBall.physicsBody!.categoryBitMask = 0b010
        blueBall.physicsBody!.collisionBitMask = playground.physicsBody!.categoryBitMask
        blueBall.physicsBody!.contactTestBitMask = 0;
        
        
        redBall.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        redBall.physicsBody!.dynamic = true;
        redBall.physicsBody!.mass = 0.1
        redBall.physicsBody!.restitution = 1.0;
        redBall.physicsBody!.friction = 0.0;
        redBall.physicsBody!.linearDamping = 0.0;
        redBall.physicsBody!.categoryBitMask = 0b100
        redBall.physicsBody!.collisionBitMask = playground.physicsBody!.categoryBitMask
        redBall.physicsBody!.contactTestBitMask = 0;
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if (node.name == "BlueBall"){
            
            var action = SKAction.sequence([
                SKAction.scaleTo(2.0, duration: 1.0),
                SKAction.scaleTo(1.0, duration: 1.0)
                ])
            node.runAction(action)
            
            node.physicsBody?.applyForce(CGVectorMake(500,500))
            
        }
        
        if (node.name == "RedBall"){
            
            var action = SKAction.sequence([
                SKAction.fadeOutWithDuration(1.0),
                SKAction.fadeInWithDuration(1.0)
                ])
            node.runAction(action)
            
            node.physicsBody?.applyForce(CGVectorMake(500,500))

        }

         
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
