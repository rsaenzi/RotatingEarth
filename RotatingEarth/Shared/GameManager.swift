//
//  GameManager.swift
//  RotatingEarth
//
//  Created by Rigoberto Sáenz Imbacuán on 9/24/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import Foundation
import WatchKit
import SceneKit

class GameManager {
   
   static func getScene() -> SCNScene? {
      
      // Loads the scene
      guard let scene = SCNScene(named: "Meshes.scnassets/Earth.scn") else {
         print("Scene 'Earth' can not be loaded")
         return nil
      }
      
      // Looks for nodes
      let earthNode = scene.rootNode.get(node: "planetEarth")
      let sunNode = scene.rootNode.get(node: "sun")
      
      // Set the rotations
      let rotationDegrees = 360 * CGFloat(Double.pi / 180.0)
      let rotationAxis = SCNVector3(x:0, y:1, z:0)
      
      let earthRotation = SCNAction.rotate(by: rotationDegrees, around: rotationAxis, duration: 10)
      earthNode.runAction(SCNAction.repeatForever(earthRotation))
      
      let sunRotation = SCNAction.rotate(by: rotationDegrees, around: rotationAxis, duration: 25)
      sunNode.runAction(SCNAction.repeatForever(sunRotation))
      
      return scene
   }
}
