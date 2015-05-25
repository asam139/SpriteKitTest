//
//  MenuScene.swift
//  Test
//
//  Created by Saul Moreno Abril on 23/5/15.
//  Copyright (c) 2015 Saul Moreno Abril. All rights reserved.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
    
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.orangeColor()
        
        var frame = self.frame;
        var _W:CGFloat = frame.size.width;
        var _H:CGFloat = frame.size.height;
        var _w:CGFloat = frame.size.width * 0.5;
        var _h:CGFloat = frame.size.height * 0.5;
        
        let titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Test";
        titleLabel.fontColor = UIColor.whiteColor()
        titleLabel.fontSize = 60.0
        titleLabel.position = CGPointMake(_w, _H * 0.9 - titleLabel.frame.size.height * 0.5);
        self.addChild(titleLabel);
        
        let playButton = SKSpriteNode(imageNamed: "play");
        playButton.position = CGPointMake(_w, _h);
        playButton.name = "PlayButton"
        self.addChild(playButton)
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if (node.name == "PlayButton"){
            
            let reveal = SKTransition.doorsOpenVerticalWithDuration(1.0)
            //let gameScene = GameScene(fileNamed: "GameScene")
            let gameScene = GameScene()
            gameScene.size = self.view!.bounds.size
            self.view?.presentScene(gameScene, transition: reveal)
            
        }
        
    }

    
    
}
