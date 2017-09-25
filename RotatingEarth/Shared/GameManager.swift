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
      
      // Looks for node
      guard let earthNode = scene.rootNode.childNode(withName: "planetEarth", recursively: false) else {
         print("No 'planetEarth' node found")
         return nil
      }
      
      // Set the Rotation
      let rotation = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180.0), around: SCNVector3(x:0, y:1, z:0), duration: 15)
      earthNode.runAction(SCNAction.repeatForever(rotation))
      
      return scene
   }
}
