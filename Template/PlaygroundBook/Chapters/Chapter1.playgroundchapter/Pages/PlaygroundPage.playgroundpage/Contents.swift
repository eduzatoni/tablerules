/*:
 # Table Setting
 
 Let's see how to set the table for different occasions.
 
 **Basic [.basic]:** This is the simplest table setting. It is used on our everyday meal.
 
 **Casual [.casual]:** That is how it starts to get a bit more complex. There are 3 different plates for soup, salad and main course. Use the utensils on the outside first and work your way inward. It is used on an special event like the first time you meet your girlfriend's parents.
 
 **Formal [.formal]:** The most complex case. Same as casual with 3 plates and rule for the utensils. If there are more than two glasses on the table it means it will be served both, red and white wine. In many cases, the cutlery for the dessert comes with it later. It is used on very important events like a dinner in Buckingham Palace.
 
 * Callout(Note):
                 Tap the object to know more about it.
 
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
setTable(/*#-editable-code*/.casual/*#-end-editable-code*/)
//: [**Next Page**](@next)
//#-hidden-code
