//
//  SceneViewController.swift
//  ARScan
//
//  Created by konglee on 2020/6/28.
//  Copyright © 2020 konglee. All rights reserved.
//

import UIKit
import SceneKit

class SceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupScene() {
        let scene = SCNScene(named: "art.scnassets/ship.scn")
        let node = scene?.rootNode.childNodes.first
        let action = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1))
        node?.runAction(action)
        node?.transform = SCNMatrix4MakeScale(5, 5, 5)
        
        let camera = SCNNode()
        camera.camera = SCNCamera()
        scene?.rootNode.addChildNode(camera)
        
        camera.position = SCNVector3Make(0, 5, 15)
        
        let lightNode = SCNNode()
        let light = SCNLight()
        light.type = .omni
        lightNode.light = light
        lightNode.position = SCNVector3Make(1, 10, 10)
        scene?.rootNode.addChildNode(lightNode)
        
        let ambientNode = SCNNode()
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientNode)
        
        let scnView = SCNView(frame: self.view.bounds)
        scnView.scene = scene
        scnView.backgroundColor = UIColor.black
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        self.view.addSubview(scnView)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
