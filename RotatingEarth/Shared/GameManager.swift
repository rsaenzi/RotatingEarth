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
   
   public static func config(scene: SCNScene?) {
      
      // Check the Scene
      guard let scene = scene else {
         print("No scene attached to Screen")
         return
      }
      
      // Looks for node
      guard let earthNode = scene.rootNode.childNode(withName: "planetEarth", recursively: false) else {
         print("No 'planetEarth' node")
         return
      }
      
      // Looks for geometry
      guard let earthGeometry = earthNode.geometry,
            let earthSphere = earthGeometry as? SCNSphere else {
         print("No 'planetEarth' geometry")
         return
      }
      
      // Looks for material
      guard let earthMaterial = earthSphere.firstMaterial else {
         print("No 'planetEarth' material")
         return
      }
      
      // Set the Textures
      earthMaterial.diffuse.contents = #imageLiteral(resourceName: "EarthDiffuse")
      earthMaterial.specular.contents = #imageLiteral(resourceName: "EarthSpecular")
      earthMaterial.normal.contents = #imageLiteral(resourceName: "EarthNormal")
      earthMaterial.emission.contents = #imageLiteral(resourceName: "EarthEmission")
      
      // Set the Rotation
      let rotation = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180.0), around: SCNVector3(x:0, y:1, z:0), duration: 15)
      earthNode.runAction(SCNAction.repeatForever(rotation))
   }
}
