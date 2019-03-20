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
    var isplaneFound = false
    var isTableSet = false
    var planePosition: SCNVector3 = SCNVector3(0, -0.5, -0.7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = Table()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        tableType = .basic
        
        sceneView.delegate = self
        titleLabel.backgroundColor = .lightGray
        descriptionView.setStyle(cornerRadius: 20, color: .lightGray, alpha: 0.6)
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        //        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        //        addButton()
        
    }
    
    func setTable(type: TableSetType) {
        setScene(position: planePosition, name: type.rawValue)
    }
    
    func setScene(position: SCNVector3, name: String) {
        if !isTableSet {
            titleLabel.changeAnimate(text: tableType.title)
            createTable(position: position, name: name)
        }
        //        else {
        //            removeNode(node: tableNode)
        //            createTable(position: position, name: name)
        //        }
    }
    
    func changeTable(type: TableSetType) {
        print("change node")
        removeNode(node: table.node)
        titleLabel.changeAnimate(text: type.title)
        createTable(position: planePosition, name: type.rawValue)
        
    }
    
    func removeNode(node: SCNNode) {
        print("remove node")
        let removeAction = SCNAction.removeFromParentNode()
        removeAction.duration = 1
        node.runAction(removeAction)
        //        node.removeFromParentNode()
    }
    
    //    func changeLabel(text: String) {
    //        //        descriptionView.showAnimate()
    //        //        showLabel(titleLabel)
    //        titleLabel.fadeTransition(1)
    //        titleLabel.text = text
    //        //        descriptionLabel.fadeTransition(1)
    //        //        descriptionLabel.text = table.description
    //    }
    
    func createTable(position: SCNVector3, name: String) {
        scene = SCNScene(named: "art.scnassets/mealScene.scn")!
        
        if let node = scene.rootNode.childNode(withName: name, recursively: true) {
            node.position = position
            self.table.node = node
            //            changeLabel(text: name)
            
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
                }  else if node.name == ObjectType.smallKnife.title {
                    node.setReflectiveMaterial()
                } else if node.name == ObjectType.napkin.title {
                    
                }
            }
        }
        isTableSet = true
        
    }
    
    // Timing function that has a "bounce in" effect
    func easeOutElastic(_ t: Float) -> Float {
        let p: Float = 0.3
        let poww = Float(pow(2.0, -10.0 * 10))
        let x = t - p / 4.0
        let y = 2.0 * Float.pi
        let sinn = sin(x * y / p)
        let result = poww * sinn + 1.0
        return result
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
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
                let position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
                planePosition = position
                setScene(position: position, name: TableSetType.basic.rawValue)
            }
        }
    }
    
    override public func receive(_ message: PlaygroundValue) {
        //        Uncomment the following to be able to receive messages from the Contents.swift playground page. You will need to define the type of your incoming object and then perform any actions with it.
        //
        guard case .string(let messageData) = message else { return }
        
        if isTableSet {
            switch messageData {
            case TableSetType.basic.rawValue:
                //                setTable(type: .basic)
                changeTable(type: .basic)
            case TableSetType.casual.rawValue:
                //                setTable(type: .casual)
                changeTable(type: .casual)
            case TableSetType.formal.rawValue:
                //                setTable(type: .formal)
                changeTable(type: .formal)
            default:
                //                changeLabel(text: "Invalid command. Try again with one of the table formats on the book.")
                //                titleLabel.text =
                titleLabel.changeAnimate(text: AlertMessage.tryAgainTable)
            }
        } else {
            //            changeLabel(text: "Invalid command. Try again with one of the table formats on the book.")
            titleLabel.changeAnimate(text: AlertMessage.tryAgainTable)
            //            titleLabel.text = "Find a surface to place your table first!"
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
            let planeAnchor = anchor as! ARPlaneAnchor
            if !isplaneFound && !isTableSet {
                let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
                let planeNode = SCNNode()
                planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
                planePosition = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
                planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
                let gridMaterial = SCNMaterial()
                gridMaterial.diffuse.contents = UIColor.red
                plane.materials = [gridMaterial]
                planeNode.geometry = plane
                planeNode.name = ObjectType.plane.title
                node.addChildNode(planeNode)
                //                titleLabel.text = "Surface found! Now tap on it to place your table!"
                //                changeLabel(text: "Surface found! Now tap on it to place your table!")
                titleLabel.changeAnimate(text: AlertMessage.surfaceFound)
                isplaneFound = true
            }
        } else {
            return
        }
    }
}
