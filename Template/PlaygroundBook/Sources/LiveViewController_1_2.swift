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

class LiveViewController_1_2: LiveViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isPlaneFound = false
    var isTableSet = false
    var tableType: TableSetType!
    var cutleryStatus: CutleryStatus!
    let planeNode = SCNNode()
    var dataArray: [CutleryStatus]  = []
    
    var table: Table!
    
    var scene: SCNScene!
    var fork: SCNNode = SCNNode()
    var knife: SCNNode = SCNNode()
    var plate: SCNNode = SCNNode()
    var mainScene: SCNNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableType = .basic
        cutleryStatus = .start
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataArray = [.start, .pause, .doNotTake, .mealOver, .mealTasty, .nextDish, .badService, .complaintsBook, .didNotLike, .willBeRegularCustomer]
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        //        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        //        addButton()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
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
        
        collectionView.isHidden = true
        collectionView.backgroundView?.alpha = 0.6
        collectionView.isPagingEnabled = false
        titleLabel.backgroundColor = .lightGray
        descriptionView.setStyle(cornerRadius: 20, color: .lightGray, alpha: 0.6)
        
        titleLabel.text = AlertMessage.findSurface
        descriptionView.isHidden = false
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
        self.collectionView?.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .centeredHorizontally)
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
        mainScene.runAction(SCNAction.move(by: SCNVector3(0, 0.5, 0), duration: 1))
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
                mainScene = plateNode
                table = Table()
                table.position = position
                //                collectionView.showAnimate()
                //                showLabel(titleLabel)
                titleLabel.changeAnimate(text: cutleryStatus.title)
                sceneView.scene.rootNode.addChildNode(plateNode)
                self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
                    if node.name == ObjectType.fork.title {
                        node.setReflectiveMaterial()
                        fork = node
                        table.fork.node = node
                    } else if node.name == ObjectType.knife.title {
                        node.setReflectiveMaterial()
                        knife = node
                        table.knife.node = node
                    } else if node.name == ObjectType.plate.title {
                        node.setPlateMaterial()
                        plate = node
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
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
                let position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
                setScene(position: position, name: tableType.rawValue)
            }
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let tappedView = sender.view as! SCNView
        let touchLocation = sender.location(in: tappedView)
        let hitTest = tappedView.hitTest(touchLocation, options: nil)
        if !hitTest.isEmpty {
            guard let result = hitTest.first else {return}
            guard let name = result.node.name else {return}
            
            switch name {
            case ObjectType.fork.title:
                performeSpeech(text: prepareSpeech(object: .fork))
            case ObjectType.knife.title:
                performeSpeech(text: prepareSpeech(object: .knife))
            case ObjectType.saladFork.title:
                performeSpeech(text: prepareSpeech(object: .saladFork))
            case ObjectType.plate.title:
                performeSpeech(text: prepareSpeech(object: .plate))
            case ObjectType.soupSpoon.title:
                performeSpeech(text: prepareSpeech(object: .soupSpoon))
            case ObjectType.table.title:
                performeSpeech(text: prepareSpeech(object: .table))
            case ObjectType.waterGlass.title:
                performeSpeech(text: prepareSpeech(object: .waterGlass))
            case ObjectType.wineGlass.title:
                performeSpeech(text: prepareSpeech(object: .wineGlass))
            default:
                print("ibuiuiuiu")
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

extension LiveViewController_1_2: ARSCNViewDelegate {
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
