/*:# Cutlery Rules:

**Let the dinner begin!**
 Here are the first basic rules to avoid embarrassing moments and enjoy your dinner night to the fullest! Always use the utensils on the outside first and work your way inward. Same applies for the starters. Spoon on the right means there will be a soup course. If there are more than two glasses on the table it means it will be served both, red and white wine. In many cases, the cutlery for the dessert comes with it later.
  */
 //#-end-hidden-code
 //setRule(.start)
 //#-hidden-code
/*:#
**I need a break!**
 You are taking a break during your lunch or dinner. Place your fork and knife in the center of the plate forming an inverted "V".
  */
 //#-end-hidden-code
 //setRule(.pause)
 //#-hidden-code
 /*
**Do not take the plate!**
 Like this you inform the waiter to keep your plate on the table.
  */
 //#-end-hidden-code
 //setRule(.doNotTake)
 //#-hidden-code
 /*
**I'm done!**
 Place your knife and fork together in the center of the plate pointing to your front to indicate that you have finished.
  */
 //#-end-hidden-code
 //setRule(.mealOver)
 //#-hidden-code
 /*
 **The meal was delicious!**
 In case you have finished your meal and you want to show that it was excellent you place your knife and fork pointing to the right.
  */
 //#-end-hidden-code
 //setRule(.mealTasty)
 //#-hidden-code
 /*
**I am ready for the next dish!**
 In a meal with many courses, place your knife and fork in a cross on the plate with a fork pouting to the front and the knife pointing to the left.
  */
 //#-end-hidden-code
 //setRule(.nextDish)
 //#-hidden-code
 /*
**The service was bad!**
 Let the waiter know that you did not like the service placing your knife and fork forming a "V".
  */
 //#-end-hidden-code
 //setRule(.badService)
 //#-hidden-code
 /*
**The dish was horrible!**
 To show that you did not like the dish you place your fork and knife in the center of the plate pointing to you. The cutlery crosses.
  */
 //#-end-hidden-code
 //setRule(.didNotLike)
 //#-hidden-code
 /*
**I would like to complain!**
 After a bad service or unsatisfactory meal, you can ask for the complaints book. Place you fork and knife in the center of the table pointing to you.
  */
 //#-end-hidden-code
 //setRule(.complaintsBook)
 //#-hidden-code
 /*
**I loved it! I definitely will come back!**
 You really enjoy the service and food and want to say you will return more times? Place your fork above you knife on your left side pointing to your fro                                                                                                                                                                                                                                                                                                                                                                                                              nt in diagonal.
 //#-end-hidden-code
 //setRule(.willBeRegularCustomer)
 //#-hidden-code
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
//Use the call below to send a message with an object to the LiveView of this page. Import Foundation is required.
//sendValue(.data(try NSKeyedArchiver.archivedData(withRootObject: /*YourObject*/, requiringSecureCoding: true)))
func setRule(_ type: CutleryStatus) {
    sendValue(.string(type.rawValue))
}
//#-end-hidden-code
setRule(/*#-editable-code*/.start/*#-end-editable-code*/)
//: [Previous](@previous) ||
//: [Next](@next)

