//
//  GameInterfaceController.swift
//  watchOS Extension
//
//  Created by Rigoberto Sáenz Imbacuán on 9/21/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import WatchKit
import SceneKit

class GameInterfaceController: WKInterfaceController {

   @IBOutlet var sceneInterface: WKInterfaceSCNScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
      
      // Set up the interface
      sceneInterface.showsStatistics = true
      sceneInterface.preferredFramesPerSecond = 30
      sceneInterface.isPlaying = true
      
      // Set up the Scene
      sceneInterface.scene = GameManager.getScene()
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
