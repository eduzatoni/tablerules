/*:# Cutlery Rules:
 
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
setTable(/*#-editable-code*/.basic/*#-end-editable-code*/)
//: [**Previous Page**](@previous)
