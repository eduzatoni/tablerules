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
import AVFoundation

class LiveViewController_1_2: LiveViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    
    var isPlaneFound = false
    var isTableSet = false
    var cutleryStatus: CutleryStatus!
    let planeNode = SCNNode()
    
    var table: Table!
    
    var scene: SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = Table(setType: .casual)

        cutleryStatus = .start
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        //        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
//        addButton()
        
        sceneView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:))))
    }
    
    public override func receive(_ message: PlaygroundValue) {
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
                case CutleryStatus.done.rawValue:
                    setCutleryPosition(status: .done)
                case CutleryStatus.delicious.rawValue:
                    setCutleryPosition(status: .delicious)
                case CutleryStatus.nextDish.rawValue:
                    setCutleryPosition(status: .nextDish)
                case CutleryStatus.badService.rawValue:
                    setCutleryPosition(status: .badService)
                case CutleryStatus.complain.rawValue:
                    setCutleryPosition(status: .complain)
                case CutleryStatus.horrible.rawValue:
                    setCutleryPosition(status: .horrible)
                case CutleryStatus.willComeBack.rawValue:
                    setCutleryPosition(status: .willComeBack)
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
    
    func addButton() {
        let button = UIButton(frame: CGRect(x: 250, y: 50, width: 100, height: 50))
        button.backgroundColor = .lightGray
        button.alpha = 0.7
        button.setTitle("Table Up", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        setCutleryPosition(status: .badService)    }
    
    func setCutleryPosition(status: CutleryStatus) {
        if table.status != status {
            table.status = status
            titleLabel.changeAnimate(text: status.title)
            animateCutlery(table.fork)
            animateCutlery(table.knife)
            
            if status == .start {
                showObjects(nodes: [table.breadPlate.node, table.saladPlate.node, table.napkin.node, table.soupPlate.node, table.soupSpoon.node, table.saladFork.node])
            } else {
                hideObjects(nodes: [table.breadPlate.node, table.saladPlate.node, table.napkin.node, table.soupPlate.node, table.soupSpoon.node, table.saladFork.node])
            }
        }
    }
    
    func hideObjects(nodes: [SCNNode]){
        for n in nodes {
            n.hideAnimate(duration: 1)
        }
    }
    
    func showObjects(nodes: [SCNNode]) {
        for n in nodes {
            n.showAnimate(duration: 1)
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
            if let node = scene.rootNode.childNode(withName: name, recursively: true) {
                node.position = position
                node.eulerAngles = table.node.eulerAngles
                self.table.node = node
                titleLabel.changeAnimate(text: cutleryStatus.title)
                sceneView.scene.rootNode.addChildNode(node)
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
                        table.saladFork.node = node
                        node.setReflectiveMaterial()
                    } else if node.name == ObjectType.soupSpoon.title {
                        table.soupSpoon.node = node
                        node.setReflectiveMaterial()
                    }  else if node.name == ObjectType.breadKnife.title {
                        node.setReflectiveMaterial()
                    } else if node.name == ObjectType.napkin.title {
                        table.napkin.node = node
                    } else if node.name == ObjectType.soupPlate.title {
                        table.soupPlate.node = node
                    }
                }
            }
            isTableSet = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
                let position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
                setScene(position: position, name: table.setType.rawValue)
            }
        }
    }
    
    func alertMessage(title: String, message: String){
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertContoller.addAction(action)
        self.present(alertContoller, animated: true, completion: nil)
    }
}

extension LiveViewController_1_2: ARSCNViewDelegate {
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
