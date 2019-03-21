//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import Foundation
import PlaygroundSupport
import UIKit
import SceneKit
import ARKit
import AVFoundation

class LiveViewController_1_3: LiveViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    
    var isPlaneFound = false
    var isTableSet = false
    
    var table: Table!
    var scene: SCNScene!
    let planeNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        //        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        //        addButton()
    }
    
    public override func receive(_ message: PlaygroundValue) {
        //        Uncomment the following to be able to receive messages from the Contents.swift playground page. You will need to define the type of your incoming object and then perform any actions with it.
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        titleLabel.backgroundColor = .lightGray
        descriptionView.setStyle(cornerRadius: 20, color: .lightGray, alpha: 0.6)
        
        titleLabel.text = AlertMessage.findSurface
        descriptionView.isHidden = false
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    func addButton() {
        let button = UIButton(frame: CGRect(x: 250, y: 50, width: 100, height: 50))
        button.backgroundColor = .lightGray
        button.alpha = 0.7
        button.setTitle("Table Up", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func setScene(position: SCNVector3, name: String) {
        if !isTableSet {
            scene = SCNScene(named: "art.scnassets/mealScene.scn")!
            if let plateNode = scene.rootNode.childNode(withName: name, recursively: true) {
                plateNode.position = position
                table = Table(setType: .formal)
                table.position = position
                titleLabel.changeAnimate(text: AlertMessage.pressObject)
                sceneView.scene.rootNode.addChildNode(plateNode)
                self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
                    if node.name == ObjectType.fork.title {
                        node.setReflectiveMaterial()
                        table.fork.node = node
                    } else if node.name == ObjectType.knife.title {
                        node.setReflectiveMaterial()
                        table.knife.node = node
                    } else if node.name == ObjectType.plate.title {
                        node.setPlateMaterial()
                    } else if node.name == ObjectType.breadPlate.title {
                        table.breadPlate.node = node
                        node.setPlateMaterial()
                    } else if node.name == ObjectType.saladPlate.title {
                        table.saladPlate.node = node
                        node.setPlateMaterial()
                    } else if node.name == ObjectType.wineGlass.title {
                        //                        setReflectiveMaterial(node: node)
                    } else if node.name == ObjectType.waterGlass.title {
                        //                        setReflectiveMaterial(node: node)
                    } else if node.name == ObjectType.plane.title {
                        node.removeFromParentNode()
                    } else if node.name == ObjectType.saladFork.title {
                        node.setReflectiveMaterial()
                    } else if node.name == ObjectType.soupSpoon.title {
                        node.setReflectiveMaterial()
                    }  else if node.name == ObjectType.breadKnife.title {
                        node.setReflectiveMaterial()
                    } else if node.name == ObjectType.napkin.title {
                        table.napkin.node = node
                    }
                }
            }
            isTableSet = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            if isTableSet {
                let hitTest = sceneView.hitTest(touchLocation, options: nil)
                if !hitTest.isEmpty {
                    guard let result = hitTest.first else {return}
                    guard let name = result.node.name else {return}
                    if name == "Extrude" {
                        performeSpeech(text: "Napkin")
                    } else {
                        performeSpeech(text: name)
                    }
                }
            } else {
                let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
                
                if let hitResult = results.first {
                    let position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
                    setScene(position: position, name: table.setType.rawValue)
                }
            }
        }
    }
    
    func prepareSpeech(object: ObjectType) -> String {
        let text = "\(object.title). \(object.description)."
        return text
    }
    
    func performeSpeech(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        print("Text: \(text)")
    }
}

extension LiveViewController_1_3: ARSCNViewDelegate {
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        print("error")
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        print("sessionWasInterrupted")
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        print("sessionInterruptionEnded")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            if !isTableSet {
                let planeAnchor = anchor as! ARPlaneAnchor
                
                if isPlaneFound {
                    print("Remove plane")
                    planeNode.removeFromParentNode()
                    isPlaneFound = false
                }
                print("add plane")
                let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
                
                planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
                planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
                let gridMaterial = SCNMaterial()
                gridMaterial.diffuse.contents = UIColor.red
                plane.materials = [gridMaterial]
                planeNode.geometry = plane
                planeNode.name = ObjectType.plane.title
                node.addChildNode(planeNode)
                titleLabel.changeAnimate(text: AlertMessage.surfaceFound)
                isPlaneFound = true
            }
        } else {
            return
        }
    }
}
