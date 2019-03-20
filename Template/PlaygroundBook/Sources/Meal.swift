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
    case mealOver = "mealOver"
    case mealTasty = "mealTasty"
    case nextDish = "nextDish"
    case badService = "badService"
    case complaintsBook = "complaintsBook"
    case didNotLike = "didNotLike"
    case willBeRegularCustomer = "willBeRegularCustomer"
    
    var title: String {
        switch self {
        case .start: return CutleryString.startTitle
        case .pause: return CutleryString.pauseTitle
        case .doNotTake: return CutleryString.doNotTakeTitle
        case .mealOver: return CutleryString.mealOverTitle
        case .mealTasty: return CutleryString.mealTastyTitle
        case .nextDish: return CutleryString.nextDishTitle
        case .badService: return CutleryString.badServiceTitle
        case .complaintsBook: return CutleryString.complaintsBookTitle
        case .didNotLike: return CutleryString.didNotLikeTitle
        case .willBeRegularCustomer: return CutleryString.willBeRegularCustomerTitle
        }
    }
    
    var description: String {
        switch self {
        case .start: return CutleryString.startDescription
        case .pause: return CutleryString.pauseDescription
        case .doNotTake: return CutleryString.doNotTakeDescription
        case .mealOver: return CutleryString.mealOverDescription
        case .mealTasty: return CutleryString.mealTastyDescription
        case .nextDish: return CutleryString.nextDishDescription
        case .badService: return CutleryString.badServiceDescription
        case .complaintsBook: return CutleryString.complaintsBookDescription
        case .didNotLike: return CutleryString.didNotLikeDescription
        case .willBeRegularCustomer: return CutleryString.willBeRegularCustomerDescription
        }
    }
    
    var forkPosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startForkPosition
        case .pause: return CutleryPosition.pauseForkPosition
        case .doNotTake: return CutleryPosition.doNotTakeForkPosition
        case .mealOver: return CutleryPosition.mealOverForkPosition
        case .mealTasty: return CutleryPosition.mealTastyForkPosition
        case .nextDish: return CutleryPosition.nextDishForkPosition
        case .badService: return CutleryPosition.badServiceForkPosition
        case .complaintsBook: return CutleryPosition.complaintsBookForkPosition
        case .didNotLike: return CutleryPosition.didNotLikeForkPosition
        case .willBeRegularCustomer: return CutleryPosition.willBeRegularCustomerForkPosition
        }
    }
    
    var forkRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startForkRotation
        case .pause: return CutleryPosition.pauseForkRotation
        case .doNotTake: return CutleryPosition.doNotTakeForkRotation
        case .mealOver: return CutleryPosition.mealOverForkRotation
        case .mealTasty: return CutleryPosition.mealTastyForkRotation
        case .nextDish: return CutleryPosition.nextDishForkRotation
        case .badService: return CutleryPosition.badServiceForkRotation
        case .complaintsBook: return CutleryPosition.complaintsBookForkRotation
        case .didNotLike: return CutleryPosition.didNotLikeForkRotation
        case .willBeRegularCustomer: return CutleryPosition.willBeRegularCustomerForkRotation
        }
    }
    
    var knifePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startKnifePosition
        case .pause: return CutleryPosition.pauseKnifePosition
        case .doNotTake: return CutleryPosition.doNotTakeKnifePosition
        case .mealOver: return CutleryPosition.mealOverKnifePosition
        case .mealTasty: return CutleryPosition.mealTastyKnifePosition
        case .nextDish: return CutleryPosition.nextDishKnifePosition
        case .badService: return CutleryPosition.badServiceKnifePosition
        case .complaintsBook: return CutleryPosition.complaintsBookKnifePosition
        case .didNotLike: return CutleryPosition.didNotLikeKnifePosition
        case .willBeRegularCustomer: return CutleryPosition.willBeRegularCustomerKnifePosition
        }
    }
    
    var knifeRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startKnifeRotation
        case .pause: return CutleryPosition.pauseKnifeRotation
        case .doNotTake: return CutleryPosition.doNotTakeKnifeRotation
        case .mealOver: return CutleryPosition.mealOverKnifeRotation
        case .mealTasty: return CutleryPosition.mealTastyKnifeRotation
        case .nextDish: return CutleryPosition.nextDishKnifeRotation
        case .badService: return CutleryPosition.badServiceKnifeRotation
        case .complaintsBook: return CutleryPosition.complaintsBookKnifeRotation
        case .didNotLike: return CutleryPosition.didNotLikeKnifeRotation
        case .willBeRegularCustomer: return CutleryPosition.willBeRegularCustomerKnifeRotation
        }
    }
    
    var saladPlatePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startSaladPlatePosition
        case .pause: return CutleryPosition.secondSaladPlatePosition
        case .doNotTake: return CutleryPosition.secondSaladPlatePosition
        case .mealOver: return CutleryPosition.secondSaladPlatePosition
        case .mealTasty: return CutleryPosition.secondSaladPlatePosition
        case .nextDish: return CutleryPosition.secondSaladPlatePosition
        case .badService: return CutleryPosition.secondSaladPlatePosition
        case .complaintsBook: return CutleryPosition.secondSaladPlatePosition
        case .didNotLike: return CutleryPosition.secondSaladPlatePosition
        case .willBeRegularCustomer: return CutleryPosition.secondSaladPlatePosition
        }
    }
    
    var saladPlateRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startSaladPlateRotation
        case .pause: return CutleryPosition.secondSaladPlateRotation
        case .doNotTake: return CutleryPosition.secondSaladPlateRotation
        case .mealOver: return CutleryPosition.secondSaladPlateRotation
        case .mealTasty: return CutleryPosition.secondSaladPlateRotation
        case .nextDish: return CutleryPosition.secondSaladPlateRotation
        case .badService: return CutleryPosition.secondSaladPlateRotation
        case .complaintsBook: return CutleryPosition.secondSaladPlateRotation
        case .didNotLike: return CutleryPosition.secondSaladPlateRotation
        case .willBeRegularCustomer: return CutleryPosition.secondSaladPlateRotation
        }
    }
    
    var breadPlatePosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startBreadPlatePosition
        case .pause: return CutleryPosition.secondBreadPlatePosition
        case .doNotTake: return CutleryPosition.secondBreadPlatePosition
        case .mealOver: return CutleryPosition.secondBreadPlatePosition
        case .mealTasty: return CutleryPosition.secondBreadPlatePosition
        case .nextDish: return CutleryPosition.secondBreadPlatePosition
        case .badService: return CutleryPosition.secondBreadPlatePosition
        case .complaintsBook: return CutleryPosition.secondBreadPlatePosition
        case .didNotLike: return CutleryPosition.secondBreadPlatePosition
        case .willBeRegularCustomer: return CutleryPosition.secondBreadPlatePosition
        }
    }
    
    var breadPlateRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startBreadPlateRotation
        case .pause: return CutleryPosition.secondBreadPlateRotation
        case .doNotTake: return CutleryPosition.secondBreadPlateRotation
        case .mealOver: return CutleryPosition.secondBreadPlateRotation
        case .mealTasty: return CutleryPosition.secondBreadPlateRotation
        case .nextDish: return CutleryPosition.secondBreadPlateRotation
        case .badService: return CutleryPosition.secondBreadPlateRotation
        case .complaintsBook: return CutleryPosition.secondBreadPlateRotation
        case .didNotLike: return CutleryPosition.secondBreadPlateRotation
        case .willBeRegularCustomer: return CutleryPosition.secondBreadPlateRotation
        }
    }
    
    var napkinPosition: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startNapkinPlatePosition
        case .pause: return CutleryPosition.secondNapkinPlatePosition
        case .doNotTake: return CutleryPosition.secondNapkinPlatePosition
        case .mealOver: return CutleryPosition.secondNapkinPlatePosition
        case .mealTasty: return CutleryPosition.secondNapkinPlatePosition
        case .nextDish: return CutleryPosition.secondNapkinPlatePosition
        case .badService: return CutleryPosition.secondNapkinPlatePosition
        case .complaintsBook: return CutleryPosition.secondNapkinPlatePosition
        case .didNotLike: return CutleryPosition.secondNapkinPlatePosition
        case .willBeRegularCustomer: return CutleryPosition.secondNapkinPlatePosition
        }
    }
    
    var napkinRotation: SCNVector3 {
        switch self {
        case .start: return CutleryPosition.startNapkinPlateRotation
        case .pause: return CutleryPosition.secondNapkinPlateRotation
        case .doNotTake: return CutleryPosition.secondNapkinPlateRotation
        case .mealOver: return CutleryPosition.secondNapkinPlateRotation
        case .mealTasty: return CutleryPosition.secondNapkinPlateRotation
        case .nextDish: return CutleryPosition.secondNapkinPlateRotation
        case .badService: return CutleryPosition.secondNapkinPlateRotation
        case .complaintsBook: return CutleryPosition.secondNapkinPlateRotation
        case .didNotLike: return CutleryPosition.secondNapkinPlateRotation
        case .willBeRegularCustomer: return CutleryPosition.secondNapkinPlateRotation
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
    var fork: Object
    var knife: Object
    var saladPlate: Object
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
        }
    }
    
    init() {
        fork = Object(type: .fork, position: CutleryPosition.startForkPosition, rotation: CutleryPosition.startForkRotation)
        knife = Object(type: .knife, position: CutleryPosition.startKnifePosition, rotation: CutleryPosition.startKnifeRotation)
        saladPlate = Object(type: .saladPlate, position: CutleryPosition.startSaladPlatePosition, rotation: CutleryPosition.startSaladPlateRotation)
        breadPlate = Object(type: .breadPlate, position: CutleryPosition.startBreadPlatePosition, rotation: CutleryPosition.startBreadPlateRotation)
        napkin = Object(type: .napkin, position: CutleryPosition.startNapkinPlatePosition, rotation: CutleryPosition.startNapkinPlateRotation)
        position = SCNVector3(0, 0, 0)
        node = SCNNode()
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
    case smallKnife = "smallKnife"
    case soupSpoon = "soupSpoon"
    case plate = "plate"
    case saladPlate = "saladPlate"
    case breadPlate = "breadPlate"
    case table = "table"
    case wineGlass = "wineGlass"
    case waterGlass = "waterGlass"
    case napkin = "napkin"
    case plane = "plane"
    
    var title: String {
        switch self {
        case .fork: return "Fork"
        case .saladFork: return "Salad Fork"
        case .knife: return "Knife"
        case .smallKnife: return "Small Knife"
        case .soupSpoon: return "Soup Spoon"
        case .plate: return "Plate"
        case .saladPlate: return "Salad Plate"
        case .breadPlate: return "Bread Plate"
        case .table: return "Table"
        case .wineGlass: return "Wine Glass"
        case .waterGlass: return "Water Glass"
        case .napkin: return "Napkin"
        case .plane: return "Plane"
        }
    }
    
    var description: String {
        switch self {
        case .fork: return "That's a fork"
        case .saladFork: return "That's a salad fork"
        case .knife: return "That's a knife"
        case .smallKnife: return "Small Knife"
        case .soupSpoon: return "That's a soup spoon"
        case .plate: return "That's a plate"
        case .saladPlate: return "Salad Plate"
        case .breadPlate: return "Bread Plate"
        case .table: return "That's a table"
        case .wineGlass: return "That's a wine glass"
        case .waterGlass: return "That's a water glass"
        case .napkin: return "Napkin"
        case .plane: return ""
        }
    }
}

public enum TableSetType: String {
    case basic = "basic"
    case casual = "casual"
    case formal = "formal"
}
