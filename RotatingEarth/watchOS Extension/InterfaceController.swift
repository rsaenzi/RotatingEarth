//
//  InterfaceController.swift
//  watchOS Extension
//
//  Created by Rigoberto Sáenz Imbacuán on 9/21/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import WatchKit
import Foundation
import SceneKit

class InterfaceController: WKInterfaceController {

   @IBOutlet var snInterface: WKInterfaceSCNScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
      
        // Init Scene
        let scene = SCNScene()
        self.snInterface.scene = scene
        self.snInterface.isPlaying = true

        // Camera
        let camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3()
      
        // Sphere Mesh
        let sphere = SCNSphere(radius: 1.0)
        sphere.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "EarthDiffuse")
        sphere.firstMaterial?.specular.contents = #imageLiteral(resourceName: "EarthSpecular")
        sphere.firstMaterial?.normal.contents = #imageLiteral(resourceName: "EarthNormal")
        sphere.firstMaterial?.emission.contents = #imageLiteral(resourceName: "EarthEmission")

        // Sphere Node
        let sphereNode = SCNNode(geometry: sphere)
        scene.rootNode.addChildNode(sphereNode)
      
        // Sphere Rotation
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180.0), around: SCNVector3(x:0, y:1, z:0), duration: 15)
        let repeatAction = SCNAction.repeatForever(action)
        sphereNode.runAction(repeatAction)
      
        // Use a preferredFramesPerSecond that will maintain consistent frame rate
        self.snInterface.preferredFramesPerSecond = 30
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
