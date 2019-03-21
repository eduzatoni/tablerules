//
//  Meal.swift
//  AR Cotlery
//
//  Created by Eduardo Curupana on 18/03/2019.
//  Copyright © 2019 Eduardo Curupana. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

public enum CutleryStatus: String {
    case start = "start"
    case pause = "pause"
    case doNotTake = "doNotTake"
    case done = "done"
    case delicious = "delicious"
    case nextDish = "nextDish"
    case badService = "badService"
    case complain = "complain"
    case horrible = "horrible"
    case willComeBack = "willComeBack"
    
    var title: String {
        switch self {
        case .start: return CutleryString.startTitle
        case .pause: return CutleryString.pauseTitle
        case .doNotTake: return CutleryString.doNotTakeTitle
        case .done: return CutleryString.mealOverTitle
        case .delicious: return CutleryString.mealTastyTitle
        case .nextDish: return CutleryString.nextDishTitle
        case .badService: return CutleryString.badServiceTitle
        case .complain: return CutleryString.complaintsBookTitle
        case .horrible: return CutleryString.didNotLikeTitle
        case .willComeBack: return CutleryString.willBeRegularCustomerTitle
        }
    }
    
    var description: String {
        switch self {
        case .start: return CutleryString.startDescription
        case .pause: return CutleryString.pauseDescription
        case .doNotTake: return CutleryString.doNotTakeDescription
        case .done: return CutleryString.mealOverDescription
        case .delicious: return CutleryString.mealTastyDescription
        case .nextDish: return CutleryString.nextDishDescription
        case .badService: return CutleryString.badServiceDescription
        case .complain: return CutleryString.complaintsBookDescription
        case .horrible: return CutleryString.didNotLikeDescription
        case .willComeBack: return CutleryString.willBeRegularCustomerDescription
        }
    }
    
    var forkPosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startForkPosition
        case .pause: return CutleryPosition.pauseForkPosition
        case .doNotTake: return CutleryPosition.doNotTakeForkPosition
        case .done: return CutleryPosition.mealOverForkPosition
        case .delicious: return CutleryPosition.mealTastyForkPosition
        case .nextDish: return CutleryPosition.nextDishForkPosition
        case .badService: return CutleryPosition.badServiceForkPosition
        case .complain: return CutleryPosition.complaintsBookForkPosition
        case .horrible: return CutleryPosition.didNotLikeForkPosition
        case .willComeBack: return CutleryPosition.willBeRegularCustomerForkPosition
        }
    }
    
    var forkRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startForkRotation
        case .pause: return CutleryPosition.pauseForkRotation
        case .doNotTake: return CutleryPosition.doNotTakeForkRotation
        case .done: return CutleryPosition.mealOverForkRotation
        case .delicious: return CutleryPosition.mealTastyForkRotation
        case .nextDish: return CutleryPosition.nextDishForkRotation
        case .badService: return CutleryPosition.badServiceForkRotation
        case .complain: return CutleryPosition.complaintsBookForkRotation
        case .horrible: return CutleryPosition.didNotLikeForkRotation
        case .willComeBack: return CutleryPosition.willBeRegularCustomerForkRotation
        }
    }
    
    var knifePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startKnifePosition
        case .pause: return CutleryPosition.pauseKnifePosition
        case .doNotTake: return CutleryPosition.doNotTakeKnifePosition
        case .done: return CutleryPosition.mealOverKnifePosition
        case .delicious: return CutleryPosition.mealTastyKnifePosition
        case .nextDish: return CutleryPosition.nextDishKnifePosition
        case .badService: return CutleryPosition.badServiceKnifePosition
        case .complain: return CutleryPosition.complaintsBookKnifePosition
        case .horrible: return CutleryPosition.didNotLikeKnifePosition
        case .willComeBack: return CutleryPosition.willBeRegularCustomerKnifePosition
        }
    }
    
    var knifeRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startKnifeRotation
        case .pause: return CutleryPosition.pauseKnifeRotation
        case .doNotTake: return CutleryPosition.doNotTakeKnifeRotation
        case .done: return CutleryPosition.mealOverKnifeRotation
        case .delicious: return CutleryPosition.mealTastyKnifeRotation
        case .nextDish: return CutleryPosition.nextDishKnifeRotation
        case .badService: return CutleryPosition.badServiceKnifeRotation
        case .complain: return CutleryPosition.complaintsBookKnifeRotation
        case .horrible: return CutleryPosition.didNotLikeKnifeRotation
        case .willComeBack: return CutleryPosition.willBeRegularCustomerKnifeRotation
        }
    }
    
    var saladPlatePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startSaladPlatePosition
        case .pause: return CutleryPosition.secondSaladPlatePosition
        case .doNotTake: return CutleryPosition.secondSaladPlatePosition
        case .done: return CutleryPosition.secondSaladPlatePosition
        case .delicious: return CutleryPosition.secondSaladPlatePosition
        case .nextDish: return CutleryPosition.secondSaladPlatePosition
        case .badService: return CutleryPosition.secondSaladPlatePosition
        case .complain: return CutleryPosition.secondSaladPlatePosition
        case .horrible: return CutleryPosition.secondSaladPlatePosition
        case .willComeBack: return CutleryPosition.secondSaladPlatePosition
        }
    }
    
    var saladPlateRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startSaladPlateRotation
        case .pause: return CutleryPosition.secondSaladPlateRotation
        case .doNotTake: return CutleryPosition.secondSaladPlateRotation
        case .done: return CutleryPosition.secondSaladPlateRotation
        case .delicious: return CutleryPosition.secondSaladPlateRotation
        case .nextDish: return CutleryPosition.secondSaladPlateRotation
        case .badService: return CutleryPosition.secondSaladPlateRotation
        case .complain: return CutleryPosition.secondSaladPlateRotation
        case .horrible: return CutleryPosition.secondSaladPlateRotation
        case .willComeBack: return CutleryPosition.secondSaladPlateRotation
        }
    }
    
    var breadPlatePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startBreadPlatePosition
        case .pause: return CutleryPosition.secondBreadPlatePosition
        case .doNotTake: return CutleryPosition.secondBreadPlatePosition
        case .done: return CutleryPosition.secondBreadPlatePosition
        case .delicious: return CutleryPosition.secondBreadPlatePosition
        case .nextDish: return CutleryPosition.secondBreadPlatePosition
        case .badService: return CutleryPosition.secondBreadPlatePosition
        case .complain: return CutleryPosition.secondBreadPlatePosition
        case .horrible: return CutleryPosition.secondBreadPlatePosition
        case .willComeBack: return CutleryPosition.secondBreadPlatePosition
        }
    }
    
    var breadPlateRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startBreadPlateRotation
        case .pause: return CutleryPosition.secondBreadPlateRotation
        case .doNotTake: return CutleryPosition.secondBreadPlateRotation
        case .done: return CutleryPosition.secondBreadPlateRotation
        case .delicious: return CutleryPosition.secondBreadPlateRotation
        case .nextDish: return CutleryPosition.secondBreadPlateRotation
        case .badService: return CutleryPosition.secondBreadPlateRotation
        case .complain: return CutleryPosition.secondBreadPlateRotation
        case .horrible: return CutleryPosition.secondBreadPlateRotation
        case .willComeBack: return CutleryPosition.secondBreadPlateRotation
        }
    }
    
    var napkinPosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startNapkinPosition
        case .pause: return CutleryPosition.secondNapkinPlatePosition
        case .doNotTake: return CutleryPosition.secondNapkinPlatePosition
        case .done: return CutleryPosition.secondNapkinPlatePosition
        case .delicious: return CutleryPosition.secondNapkinPlatePosition
        case .nextDish: return CutleryPosition.secondNapkinPlatePosition
        case .badService: return CutleryPosition.secondNapkinPlatePosition
        case .complain: return CutleryPosition.secondNapkinPlatePosition
        case .horrible: return CutleryPosition.secondNapkinPlatePosition
        case .willComeBack: return CutleryPosition.secondNapkinPlatePosition
        }
    }
    
    var napkinRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startNapkinRotation
        case .pause: return CutleryPosition.secondNapkinPlateRotation
        case .doNotTake: return CutleryPosition.secondNapkinPlateRotation
        case .done: return CutleryPosition.secondNapkinPlateRotation
        case .delicious: return CutleryPosition.secondNapkinPlateRotation
        case .nextDish: return CutleryPosition.secondNapkinPlateRotation
        case .badService: return CutleryPosition.secondNapkinPlateRotation
        case .complain: return CutleryPosition.secondNapkinPlateRotation
        case .horrible: return CutleryPosition.secondNapkinPlateRotation
        case .willComeBack: return CutleryPosition.secondNapkinPlateRotation
        }
    }
    
    var soupPlatePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startSoupPlatePosition
        case .pause: return CutleryPosition.secondSoupPlatePosition
        case .doNotTake: return CutleryPosition.secondSoupPlatePosition
        case .done: return CutleryPosition.secondSoupPlatePosition
        case .delicious: return CutleryPosition.secondSoupPlatePosition
        case .nextDish: return CutleryPosition.secondSoupPlatePosition
        case .badService: return CutleryPosition.secondSoupPlatePosition
        case .complain: return CutleryPosition.secondSoupPlatePosition
        case .horrible: return CutleryPosition.secondSoupPlatePosition
        case .willComeBack: return CutleryPosition.secondSoupPlatePosition
        }
    }
    
    var soupPlateRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startSoupPlateRotation
        case .pause: return CutleryPosition.secondSoupPlateRotation
        case .doNotTake: return CutleryPosition.secondSoupPlateRotation
        case .done: return CutleryPosition.secondSoupPlateRotation
        case .delicious: return CutleryPosition.secondSoupPlateRotation
        case .nextDish: return CutleryPosition.secondSoupPlateRotation
        case .badService: return CutleryPosition.secondSoupPlateRotation
        case .complain: return CutleryPosition.secondSoupPlateRotation
        case .horrible: return CutleryPosition.secondSoupPlateRotation
        case .willComeBack: return CutleryPosition.secondSoupPlateRotation
        }
    }
    
    var image: UIImage {
        if let image = UIImage(named: self.rawValue) {
            return image
        } else {
            return UIImage()
        }
    }
}

struct Table {
    var title: String
    var description: String
    var position: SCNVector3
    var node: SCNNode
    var setType: TableSetType
    var fork: Object
    var knife: Object
    var saladPlate: Object
    var soupPlate: Object
    var breadPlate: Object
    var napkin: Object
    
    private var storedStatus: CutleryStatus
    var status: CutleryStatus {
        get {
            return storedStatus
        }
        set {
            storedStatus = newValue
            title = status.title
            description = status.description
            fork.position = status.forkPosition
            fork.rotation = status.forkRotation
            knife.position = status.knifePosition
            knife.rotation = status.knifeRotation
            saladPlate.position = status.saladPlatePosition
            saladPlate.rotation = status.saladPlateRotation
            breadPlate.position = status.breadPlatePosition
            breadPlate.rotation = status.breadPlateRotation
            napkin.position = status.napkinPosition
            napkin.rotation = status.napkinRotation
            soupPlate.position = status.soupPlatePosition
            soupPlate.rotation = status.soupPlateRotation
        }
    }
    
    init(setType: TableSetType) {
        fork = Object(type: .fork, position: CutleryPosition.startForkPosition, rotation: CutleryPosition.startForkRotation)
        knife = Object(type: .knife, position: CutleryPosition.startKnifePosition, rotation: CutleryPosition.startKnifeRotation)
        saladPlate = Object(type: .saladPlate, position: CutleryPosition.startSaladPlatePosition, rotation: CutleryPosition.startSaladPlateRotation)
        breadPlate = Object(type: .breadPlate, position: CutleryPosition.startBreadPlatePosition, rotation: CutleryPosition.startBreadPlateRotation)
        napkin = Object(type: .napkin, position: CutleryPosition.startNapkinPosition, rotation: CutleryPosition.startNapkinRotation)
        soupPlate = Object(type: .soupPlate, position: CutleryPosition.startSoupPlatePosition, rotation: CutleryPosition.startSoupPlateRotation)
        position = SCNVector3(0, 0, 0)
        node = SCNNode()
        self.setType = setType
        self.title = CutleryStatus.start.title
        self.description = CutleryStatus.start.description
        self.storedStatus = .start
        self.status = .start
    }
}

struct Object {
    var position: SCNVector3!
    var rotation: SCNVector3!
    var node: SCNNode!
    var type: ObjectType
    
    init(type: ObjectType, position: SCNVector3, rotation: SCNVector3) {
        self.type = type
        self.position = position
        self.rotation = rotation
        self.node = SCNNode()
    }
}

enum ObjectType: String{
    case fork = "fork"
    case saladFork = "faladFork"
    case knife = "knife"
    case breadKnife = "breadKnife"
    case soupSpoon = "soupSpoon"
    case plate = "plate"
    case saladPlate = "saladPlate"
    case breadPlate = "breadPlate"
    case soupPlate = "soupPlate"
    case table = "table"
    case wineGlass = "wineGlass"
    case waterGlass = "waterGlass"
    case napkin = "napkin"
    case plane = "plane"
    case placemat = "placemat"
    
    var title: String {
        switch self {
        case .fork: return "Fork"
        case .saladFork: return "Salad Fork"
        case .knife: return "Knife"
        case .breadKnife: return "Bread Knife"
        case .soupSpoon: return "Soup Spoon"
        case .plate: return "Plate"
        case .saladPlate: return "Salad Plate"
        case .soupPlate: return "soupPlate"
        case .breadPlate: return "Bread Plate"
        case .table: return "Table"
        case .wineGlass: return "Wine Glass"
        case .waterGlass: return "Water Glass"
        case .napkin: return "Napkin"
        case .plane: return "Plane"
        case .placemat: return "Placemat"
        }
    }
    
    var description: String {
        switch self {
        case .fork: return "That's a fork"
        case .saladFork: return "That's a salad fork"
        case .knife: return "That's a knife"
        case .breadKnife: return "Bread Knife"
        case .soupSpoon: return "That's a soup spoon"
        case .plate: return "That's a plate"
        case .saladPlate: return "Salad Plate"
        case .soupPlate: return "Soup Plate"
        case .breadPlate: return "Bread Plate"
        case .table: return "That's a table"
        case .wineGlass: return "That's a wine glass"
        case .waterGlass: return "That's a water glass"
        case .napkin: return "Napkin"
        case .plane: return ""
        case .placemat: return ""
        }
    }
}

public enum TableSetType: String {
    case basic = "basic"
    case casual = "casual"
    case formal = "formal"
    
    var title: String {
        switch self {
        case .basic: return "Basic"
        case .casual: return "Casual"
        case .formal: return "Formal"
        }
    }
}
