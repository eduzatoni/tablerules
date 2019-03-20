/*: # Table Rules
 Here are the first basic rules to avoid embarrassing moments and enjoy your dinner night to the fullest! Always use the utensils on the outside first and work your way inward. Same applies for the starters. Spoon on the right means there will be a soup course. If there are more than two glasses on the table it means it will be served both, red and white wine. In many cases, the cutlery for the dessert comes with it later.
 
 First, let's see how to set the table for different occasion.
 
 **Basic**
 
 
 **Casual**
 
 
 **Formal**
 
 
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
//Use the call below to send a message with an object to the LiveView of this page. Import Foundation is required.
//sendValue(.data(try NSKeyedArchiver.archivedData(withRootObject: /*YourObject*/, requiringSecureCoding: true)))
func setTable(_ type: TableSetType) {
    sendValue(.string(type.rawValue))
}

//#-end-hidden-code
//Choose the table setting calling the function.
setTable(/*#-editable-code*/.basic/*#-end-editable-code*/)
//: [**Next Page**](@next)
