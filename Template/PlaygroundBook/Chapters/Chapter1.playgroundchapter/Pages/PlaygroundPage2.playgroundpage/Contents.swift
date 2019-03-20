/*:
 **Let the dinner begin!**
 
 That is how your dinner starts. Fork on your left and knife on your right.
 */
//setRule(.start)
/*:
 **I need a break!**
 
 You are taking a break during your lunch or dinner. Place your fork and knife in the center of the place forming an inverted 'V'.*/
//setRule(.doNotTake)
/*:
 **Do not take the plate!**
 
 Like this you inform the waiter to keep your plate on the table.
 */
//setRule(.doNotTake)
/*:
 **I'm done!**
 
 Place your knife and fork together in the center of the plate pointing to your front to indicate that you have finished.
 */
//setRule(.mealOver)
/*:
 **The meal was delicious!**
 
 In case you have finished your meal and you want to show that it was excellent you place your knife and fork pointing to the right.
 */
//setRule(.mealTasty)
/*:
 **I am ready for the next dish!**
 
 In a meal with many courses, place your knife and fork in a cross on the plate with a fork pouting to the front and the knife pointing to the left.
 */
//setRule(.nextDish)
/*:
 **The service was bad!**
 
 Let the waiter know that you did not like the service placing your knife and fork forming a 'V'.
 */
//setRule(.badService)
/*:
 **I would like to complain!**
 
 After a bad service or unsatisfactory meal you can ask for the complaints book. Place you fork and knife in the center of the table pointing to you.
 */
//setRule(.complaintsBook)
/*:
 **The dish was horrible!**
 
 After a bad service or unsatisfactory meal, you can ask for the complaints book. Place your fork and knife in the center of the plate pointing to you.
 */
//setRule(.didNotLike)
/*:
 **I loved it! I definitely will come back!**
 
 You really enjoy the service and food and want to say you will return more times? Place you fork above your knife on your right side pointing to your front in diagonal.
 */
//setRule(.willBeRegularCustomer)


//#-hidden-code
import UIKit
import PlaygroundSupport
//Use the call below to send a message with an object to the LiveView of this page. Import Foundation is required.
//sendValue(.data(try NSKeyedArchiver.archivedData(withRootObject: /*YourObject*/, requiringSecureCoding: true)))
func setRule(_ type: CutleryStatus) {
    sendValue(.string(type.rawValue))
}
//#-end-hidden-code
//Choose the cutlery rule calling the function.
setRule(/*#-editable-code*/.start/*#-end-editable-code*/)
//: [**Previous Page**](@previous)

