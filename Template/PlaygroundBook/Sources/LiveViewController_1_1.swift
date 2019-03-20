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

class LiveViewController_1_1: LiveViewController {
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var tableType: TableSetType!
    
    var tablePosition = SCNVector3()
    var table = Table()
    var scene: SCNScene!
    var isPlaneFound = false
    var isTableSet = false
    let planeNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = Table()
        tableType = .basic
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.delegate = self
        titleLabel.backgroundColor = .lightGray
        descriptionView.setStyle(cornerRadius: 20, color: .lightGray, alpha: 0.6)
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        //        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        //        addButton()
        sceneView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:))))
        
    }
    
    var currentAngleY: Float = 0.0
    
    @objc func panGesture(_ gesture: UIPanGestureRecognizer) {
        
        
        let translation = gesture.translation(in: gesture.view!)
        var newAngleY = (Float)(translation.x)*(Float)(Double.pi)/180.0
        newAngleY += currentAngleY
        
        table.node.eulerAngles.y = newAngleY
        
        if(gesture.state == .ended) { currentAngleY = newAngleY }
//        gesture.minimumNumberOfTouches = 1
//
//        let results = self.sceneView.hitTest(gesture.location(in: gesture.view), types: ARHitTestResult.ResultType.featurePoint)
//        guard let result: ARHitTestResult = results.first else {
//            return
//        }
//
//        let position = SCNVector3Make(result.worldTransform.columns.3.x, result.worldTransform.columns.3.y, result.worldTransform.columns.3.z)
//
//        let moveTo = SCNAction.move(to: position, duration: 0)
//        table.node.runAction(moveTo)
    }
    
    func setTable(type: TableSetType) {
        setScene(position: planeNode.position, name: type.rawValue)
    }
    
    func setScene(position: SCNVector3, name: String) {
        if !isTableSet {
            titleLabel.changeAnimate(text: tableType.title)
            createTable(position: position, name: name)
        }
    }
    
    func changeTable(type: TableSetType) {
        print("change node")
        removeNode(node: table.node)
        titleLabel.changeAnimate(text: type.title)
        createTable(position: table.node.position, name: type.rawValue)
    }
    
    func removeNode(node: SCNNode) {
        print("remove node")
        let removeAction = SCNAction.removeFromParentNode()
        removeAction.duration = 1
        node.runAction(removeAction)
    }
    
    func createTable(position: SCNVector3, name: String) {
        scene = SCNScene(named: "art.scnassets/mealScene.scn")!
        
        if let node = scene.rootNode.childNode(withName: name, recursively: true) {
            node.position = position
            node.eulerAngles = table.node.eulerAngles
            self.table.node = node
            
            sceneView.scene.rootNode.addChildNode(node)
            self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
                if node.name == ObjectType.fork.title {
                    table.fork.node = node
                    node.setReflectiveMaterial()
                } else if node.name == ObjectType.knife.title {
                    node.setReflectiveMaterial()
                } else if node.name == ObjectType.plate.title {
                    node.setPlateMaterial()
                } else if node.name == ObjectType.breadPlate.title {
                    node.setPlateMaterial()
                } else if node.name == ObjectType.saladPlate.title {
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
                    
                }
            }
        }
        isTableSet = true
    }
    
    func removeTable(node: SCNNode) {
        node.removeFromParentNode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        titleLabel.text = AlertMessage.findSurface
        
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
        changeTable(type: .formal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
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
    
    func performeSpeech(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        print("Text: \(text)")
    }
    
    override public func receive(_ message: PlaygroundValue) {
        //        Uncomment the following to be able to receive messages from the Contents.swift playground page. You will need to define the type of your incoming object and then perform any actions with it.
        guard case .string(let messageData) = message else { return }
        if isPlaneFound {
            if isTableSet {
                switch messageData {
                case TableSetType.basic.rawValue:
                    changeTable(type: .basic)
                case TableSetType.casual.rawValue:
                    changeTable(type: .casual)
                case TableSetType.formal.rawValue:
                    changeTable(type: .formal)
                default:
                    titleLabel.changeAnimate(text: AlertMessage.tryAgainTable)
                }
            } else {
                titleLabel.changeAnimate(text: AlertMessage.placeTable)
            }
        } else {
            titleLabel.changeAnimate(text: AlertMessage.findSurface)
        }
    }
}

extension LiveViewController_1_1: ARSCNViewDelegate {
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
            
//            if !isplaneFound && !isTableSet {
//
//            }
        } else {
            return
        }
    }
}
