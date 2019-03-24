//
//  Meal.swift
//  AR Cotlery
//
//  Created by Eduardo Curupana on 18/03/2019.
//  Copyright © 2019 Eduardo Curupana. All rights reserved.
//

import Foundation
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
    var saladFork: Object
    var soupSpoon: Object
    
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
        }
    }
    
    init(setType: TableSetType) {
        fork = Object(type: .fork, position: CutleryPosition.startForkPosition, rotation: CutleryPosition.startForkRotation)
        knife = Object(type: .knife, position: CutleryPosition.startKnifePosition, rotation: CutleryPosition.startKnifeRotation)
        saladPlate = Object(type: .saladPlate, position: CutleryPosition.startSaladPlatePosition, rotation: CutleryPosition.startSaladPlateRotation)
        breadPlate = Object(type: .breadPlate, position: CutleryPosition.startBreadPlatePosition, rotation: CutleryPosition.startBreadPlateRotation)
        napkin = Object(type: .napkin, position: CutleryPosition.startNapkinPosition, rotation: CutleryPosition.startNapkinRotation)
        soupPlate = Object(type: .soupPlate, position: CutleryPosition.startSoupPlatePosition, rotation: CutleryPosition.startSoupPlateRotation)
        saladFork = Object(type: .saladFork, position: CutleryPosition.startSaladForkPosition, rotation: CutleryPosition.startSaladForkRotation)
        soupSpoon = Object(type: .soupSpoon, position: CutleryPosition.startSoupSpoonPosition, rotation: CutleryPosition.startSoupSpoonRotation)
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
        case .soupPlate: return "Soup Plate"
        case .breadPlate: return "Bread Plate"
        case .table: return "Table"
        case .wineGlass: return "Wine Glass"
        case .waterGlass: return "Water Glass"
        case .napkin: return "Napkin"
        case .plane: return "Plane"
        case .placemat: return "Placemat"
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
