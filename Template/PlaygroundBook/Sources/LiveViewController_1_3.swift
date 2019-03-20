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
    var tableType: TableSetType!
    
    var table: Table!
    
    var scene: SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableType = .formal
        
        
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
        guard case .string(let messageData) = message else { return }
        
        if isPlaneFound {
            if isTableSet {
                switch messageData {
                case CutleryStatus.start.rawValue:
                    setCutleryPosition(status: .start)
                case CutleryStatus.pause.rawValue:
                    setCutleryPosition(status: .pause)
                case CutleryStatus.doNotTake.rawValue:
                    setCutleryPosition(status: .doNotTake)
                case CutleryStatus.mealOver.rawValue:
                    setCutleryPosition(status: .mealOver)
                case CutleryStatus.mealTasty.rawValue:
                    setCutleryPosition(status: .mealTasty)
                case CutleryStatus.nextDish.rawValue:
                    setCutleryPosition(status: .nextDish)
                case CutleryStatus.badService.rawValue:
                    setCutleryPosition(status: .badService)
                case CutleryStatus.complaintsBook.rawValue:
                    setCutleryPosition(status: .complaintsBook)
                case CutleryStatus.didNotLike.rawValue:
                    setCutleryPosition(status: .didNotLike)
                case CutleryStatus.willBeRegularCustomer.rawValue:
                    setCutleryPosition(status: .willBeRegularCustomer)
                default:
                    titleLabel.text = AlertMessage.tryAgainRule
                }
            } else {
                titleLabel.text = AlertMessage.placeTable
            }
        } else {
            titleLabel.text = AlertMessage.placeTable
        }
        
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
    
    func setCutleryPosition(status: CutleryStatus) {
        if table.status != status {
            table.status = status
            titleLabel.changeAnimate(text: status.title)
            animateCutlery(table.fork)
            animateCutlery(table.knife)
            animateCutlery(table.breadPlate)
            animateCutlery(table.saladPlate)
            animateCutlery(table.napkin)
        }
    }
    
    func animateCutlery(_ cutlery: Object) {
        guard let newPosition = cutlery.position else {return}
        guard let newRotation = cutlery.rotation else {return}
        guard let node = cutlery.node else {return}
        
        let moveUp = SCNAction.move(by: SCNVector3(x: 0, y: 0.6, z: 0), duration: 0.5)
        
        node.runAction(moveUp) {
            let moveTo = SCNAction.move(to: newPosition, duration: 1)
            let rotateTo = SCNAction.rotateTo(x: CGFloat(newRotation.x), y: CGFloat(newRotation.y), z: CGFloat(newRotation.z), duration: 1)
            
            node.runAction(moveTo)
            node.runAction(rotateTo)
        }
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
                table = Table()
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
                    }  else if node.name == ObjectType.smallKnife.title {
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
                    setScene(position: position, name: tableType.rawValue)
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
            let planeAnchor = anchor as! ARPlaneAnchor
            if !isPlaneFound {
                let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
                let planeNode = SCNNode()
                planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
                planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
                let gridMaterial = SCNMaterial()
                gridMaterial.diffuse.contents = UIColor.red
                plane.materials = [gridMaterial]
                planeNode.geometry = plane
                planeNode.name = ObjectType.plane.title
                node.addChildNode(planeNode)
                titleLabel.text = AlertMessage.surfaceFound
                isPlaneFound = true
            }
        } else {
            return
        }
    }
}
