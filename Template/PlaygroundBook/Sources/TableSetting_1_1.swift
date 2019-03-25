//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import Foundation
import PlaygroundSupport
import SceneKit
import ARKit

class TableSetting_1_1: LiveViewController {
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var table:Table!
    var scene: SCNScene!
    var isPlaneFound = false
    var isTableSet = false
    let planeNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = Table(setType: .basic)
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.delegate = self
        titleLabel.backgroundColor = .lightGray
        descriptionView.setStyle(cornerRadius: 20, color: .lightGray, alpha: 0.6)
// Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
//        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        sceneView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:))))
    }
    
    var currentAngleY: Float = 0.0
    
    @objc func panGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view!)
        var newAngleY = (Float)(translation.x)*(Float)(Double.pi)/180.0
        newAngleY += currentAngleY
        
        table.node.eulerAngles.y = newAngleY
        
        if gesture.state == .ended {
            currentAngleY = newAngleY
        }
    }
    
    func setTable(type: TableSetType) {
        setScene(position: planeNode.position, name: type.rawValue)
    }
    
    func setScene(position: SCNVector3, name: String) {
        if !isTableSet {
            titleLabel.changeAnimate(text: table.setType.title)
            createTable(position: position, name: name)
        }
    }
    
    func changeTable(type: TableSetType) {
        removeNode(node: table.node)
        titleLabel.changeAnimate(text: type.title)
        createTable(position: table.node.position, name: type.rawValue)
    }
    
    func removeNode(node: SCNNode) {
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
                    setScene(position: position, name: table.setType.rawValue)
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
    }
    
    override public func receive(_ message: PlaygroundValue) {
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
    
    func alertMessage(title: String, message: String){
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertContoller.addAction(action)
        self.present(alertContoller, animated: true, completion: nil)
    }
}

extension TableSetting_1_1: ARSCNViewDelegate {
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        alertMessage(title: "Error", message: "There was an error while loading your AR session")
        print("error")
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        alertMessage(title: "Error", message: "Your AR session was interrupted.")
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
                    planeNode.removeFromParentNode()
                    isPlaneFound = false
                }
                let plane = SCNBox(width: 1.3, height: 0.05, length: 1.8, chamferRadius: 0.2)
                
                planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
                planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
                let gridMaterial = SCNMaterial()
                gridMaterial.diffuse.contents = UIImage(named: "wood_texture.jpg")
                plane.materials = [gridMaterial]
                planeNode.geometry = plane
                planeNode.scale = SCNVector3(x: 0.425, y: 0.1, z: 0.45)
                planeNode.eulerAngles = SCNVector3(x: Float(deg2rad(0)), y: Float(deg2rad(-90)), z: Float(deg2rad(0)))
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
