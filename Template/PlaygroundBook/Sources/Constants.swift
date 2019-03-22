//
//  Constants.swift
//  AR Cotlery
//
//  Created by Eduardo Curupana on 18/03/2019.
//  Copyright © 2019 Eduardo Curupana. All rights reserved.
//

import Foundation
import SceneKit

struct CutleryPosition {
    static let startForkPosition = SCNVector3(-0.373, 0.042, 0.035)
    static let startForkRotation = SCNVector3(0, 0, 0)
    static let startKnifePosition = SCNVector3(0.374, 0.032, -0.004)
    static let startKnifeRotation = SCNVector3(0, 0, 0)
    
    static let pauseForkPosition = SCNVector3(-0.214, 0.072, 0.154)
    static let pauseForkRotation = SCNVector3(0, deg2rad(-35), 0)
    static let pauseKnifePosition = SCNVector3(0.214, 0.06, 0.154)
    static let pauseKnifeRotation = SCNVector3(0, deg2rad(35), 0)
    
    static let doNotTakeForkPosition = SCNVector3(-0.07, 0.07, 0)
    static let doNotTakeForkRotation = SCNVector3(0, deg2rad(-40), 0)
    static let doNotTakeKnifePosition = SCNVector3(0.04, 0.065, 0)
    static let doNotTakeKnifeRotation = SCNVector3(0, deg2rad(40), 0)
    
    static let mealOverForkPosition = SCNVector3(-0.06, 0.07, 0.0355)
    static let mealOverForkRotation = SCNVector3(0, 0, 0)
    static let mealOverKnifePosition = SCNVector3(0.06, 0.06, 0)
    static let mealOverKnifeRotation = SCNVector3(0, 0, 0)
    
    static let mealTastyForkPosition = SCNVector3(0, 0.06, -0.06)
    static let mealTastyForkRotation = SCNVector3(0, deg2rad(-90), 0)
    static let mealTastyKnifePosition = SCNVector3(0, 0.06, 0.06)
    static let mealTastyKnifeRotation = SCNVector3(0, deg2rad(-90), 0)
    
    static let nextDishForkPosition = SCNVector3(0, 0.06, 0)
    static let nextDishForkRotation = SCNVector3(0, 0, 0)
    static let nextDishKnifePosition = SCNVector3(0, 0.05, 0)
    static let nextDishKnifeRotation = SCNVector3(0, deg2rad(90), 0)
    
    static let badServiceForkPosition = SCNVector3(-0.08, 0.06, -0.08)
    static let badServiceForkRotation = SCNVector3(deg2rad(170), deg2rad(-40), deg2rad(-180))
    static let badServiceKnifePosition = SCNVector3(0.08, 0.054, -0.1)
    static let badServiceKnifeRotation = SCNVector3(deg2rad(180), deg2rad(40), deg2rad(-180))
    
    static let complaintsBookForkPosition = SCNVector3(-0.06, 0.06, 0.035)
    static let complaintsBookForkRotation = SCNVector3(0, deg2rad(180), 0)
    static let complaintsBookKnifePosition = SCNVector3(0.06, 0.06, 0)
    static let complaintsBookKnifeRotation = SCNVector3(deg2rad(180), 0, 0)
    
    static let didNotLikeForkPosition = SCNVector3(-0.08, 0.077, 0.044)
    static let didNotLikeForkRotation = SCNVector3(deg2rad(40.229), deg2rad(-22.345), deg2rad(-68.795))
    static let didNotLikeKnifePosition = SCNVector3(0.074, 0.074, 0.03)
    static let didNotLikeKnifeRotation = SCNVector3(deg2rad(23.062), deg2rad(38.998), deg2rad(30.746))
    
    static let willBeRegularCustomerForkPosition = SCNVector3(0.16, 0.083, 0.13)
    static let willBeRegularCustomerForkRotation = SCNVector3(deg2rad(-0.9), deg2rad(45), 0)
    static let willBeRegularCustomerKnifePosition = SCNVector3(0.16, 0.06, 0.13)
    static let willBeRegularCustomerKnifeRotation = SCNVector3(0, deg2rad(45), 0)
    
    static let startBreadPlatePosition = SCNVector3(-0.261, 0.019, -0.42)
    static let startBreadPlateRotation = SCNVector3(0, 0, 0)
    
    static let startSaladPlatePosition = SCNVector3(0, 0.026, 0)
    static let startSaladPlateRotation = SCNVector3(0, 0, 0)
    
    static let startNapkinPosition = SCNVector3(0, 0.085, 0)
    static let startNapkinRotation = SCNVector3(deg2rad(90), 0, 0)
    
    static let startSoupPlatePosition = SCNVector3(-0.03, 0.05, 0)
    static let startSoupPlateRotation = SCNVector3(0, 0, 0)
    
    static let startSoupSpoonPosition = SCNVector3(0.429, 0.046, 0.036)
    static let startSoupSpoonRotation = SCNVector3(0, 0, 0)
    
    static let startSaladForkPosition = SCNVector3(-0.426, 0.041, 0.046)
    static let startSaladForkRotation = SCNVector3(0, 0, 0)
    
}

struct CutleryString {
    static let startTitle = "Let the dinner begin!"
    static let startDescription = "Here are the first basic rules to avoid embarrassing moments and enjoy your dinner night to the fullest! Always use the utensils on the outside first and work your way inward. Same applies for the starters. Spoon on the right means there will be a soup course. If there are more than two glasses on the table it means it will be served both, red and white wine. In many cases, the cutlery for the dessert comes with it later."
    static let pauseTitle = "I need a break!"
    static let pauseDescription = "You are taking a break during your lunch or dinner. Place your fork and knife in the center of the place forming an inverted 'V'."
    static let doNotTakeTitle = "Do not take the plate!"
    static let doNotTakeDescription = "Like this you inform the waiter to keep your plate on the table."
    static let mealOverTitle = "I'm done!"
    static let mealOverDescription = "Place your knife and fork together in the center of the plate pointing to your front to indicate that you have finished."
    static let mealTastyTitle = "The meal was delicious!"
    static let mealTastyDescription = "In case you have finished your meal and you want to show that it was excellent you place your knife and fork pointing to the right."
    static let nextDishTitle = "I am ready for the next dish!"
    static let nextDishDescription = "In a meal with many courses, place your knife and fork in a cross on the plate with a fork pouting to the front and the knife pointing to the left."
    static let badServiceTitle = "The service was bad!"
    static let badServiceDescription = "Let the waiter know that you did not like the service placing your knife and fork forming a 'V'."
    static let complaintsBookTitle = "I would like to complain!"
    static let complaintsBookDescription = "After a bad service or unsatisfactory meal you can ask for the complaints book. Place you fork and knife in the center of the table pointing to you."
    static let didNotLikeTitle = "The dish was horrible!"
    static let didNotLikeDescription = "After a bad service or unsatisfactory meal, you can ask for the complaints book. Place your fork and knife in the center of the plate pointing to you."
    static let willBeRegularCustomerTitle = "I loved it! I definitely will come back!"
    static let willBeRegularCustomerDescription = "You really enjoy the service and food and want to say you will return more times? Place you fork above your knife on your right side pointing to your front in diagonal."
}

struct AlertMessage {
    static let findSurface = "Find a surface!"
    static let surfaceFound = "Now tap on it to place your utensils!"
    static let placeTable = "First place your table."
    static let tryAgainTable = "Try again with one of the table formats on the book."
    static let tryAgainRule = "Try again with one of the rules on the book."
    static let findSurfaceBefore = "Place your table first!"
    static let pressObject = "Press on the objects to listen to their utility"
}

func deg2rad(_ number: Double) -> Double {
    return number * .pi / 180
}
