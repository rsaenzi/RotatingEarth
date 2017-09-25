//
//  SCNNode+Load.swift
//  RotatingEarth
//
//  Created by Rigoberto Sáenz Imbacuán on 9/25/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import SceneKit

extension SCNNode {

   public func get(node: String) -> SCNNode {
      guard let loadedNode: SCNNode = self.childNode(withName: node, recursively: false) else {
         fatalError("None with name '\(node)' can not be found")
      }
      return loadedNode
   }
}
