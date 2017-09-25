//
//  GameViewController.swift
//  RotatingEarth
//
//  Created by Rigoberto Sáenz Imbacuán on 9/21/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit
import SceneKit
import GameplayKit

class GameViewController: UIViewController {

   @IBOutlet weak var gameView: SCNView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      // Set up the interface
      gameView.showsStatistics = true
      gameView.preferredFramesPerSecond = 30
      gameView.isPlaying = true
      
      // Set up the Scene
      gameView.scene = GameManager.getScene()
    }
}
