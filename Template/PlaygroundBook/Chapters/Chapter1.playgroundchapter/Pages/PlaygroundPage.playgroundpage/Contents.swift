/*:
 
  Here are the first basic rules to avoid embarrassing moments and enjoy your dinner night to the fullest! Always use the utensils on the outside first and work your way inward. Same applies for the starters. Spoon on the right means there will be a soup course. If there are more than two glasses on the table it means it will be served both, red and white wine. In many cases, the cutlery for the dessert comes with it later.
 
 # Table Setting
 
 Let's see how to set the table for different occasions.
 
 **Basic:** Everyday meal.
 
 **Casual:** Special Meal.
 
 **Formal:** Really important meal.
 
 * Callout(Note):
                 Tap the object to know more.
 
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
import Foundation
//Use the call below to send a message with an object to the LiveView of this page. Import Foundation is required.
//sendValue(.data(try NSKeyedArchiver.archivedData(withRootObject: /*YourObject*/, requiringSecureCoding: true)))

PlaygroundPage.current.assessmentStatus = .fail(hints: ["You could call the function using '.formal' to set a formal table.", "You could call the function using '.casual' to set a casual table."], solution: "setTable(.formal)")

func setTable(_ type: TableSetType) {
    sendValue(.string(type.rawValue))
//    sendValue(.data(try NSKeyedArchiver.archivedData(withRootObject: type, requiringSecureCoding: true)))
}

//#-end-hidden-code
//Choose the table setting calling the function.
//.basic || .casual || .formal
setTable(/*#-editable-code*/.casual/*#-end-editable-code*/)
//#-hidden-code
//PlaygroundPage.current.assessmentStatus = .fail(["You could use .formal"])
//#-end-hidden-code
//: [**Next Page**](@next)
//#-hidden-code
