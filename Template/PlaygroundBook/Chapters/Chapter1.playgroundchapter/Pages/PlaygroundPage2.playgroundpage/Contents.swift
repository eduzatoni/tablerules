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
//    switch type {
//    case .basic:
//        sendValue(.string("casual"))
//    case .casual:
//        sendValue(.string("casual"))
//    case .formal:
//        sendValue(.string("formal"))
//    }
    
//    do {
//        sendValue(.data(try NSKeyedArchiver.archivedData(withRootObject: type, requiringSecureCoding: true)))
//    } catch let error {
//        fatalError("\(error)")
//    }
}
//#-end-hidden-code
setTable(/*#-editable-code*/.basic/*#-end-editable-code*/)
//: [Previous](@previous) ||
//: [Next](@next)
