/*:
 # Cutlery Rules
 
 Now we are going to see how you can position your cutlery to inform the waiter about the food and service.
 
 **Let the dinner begin [.start]:** That is how your dinner starts. Fork on your left and knife on your right.
 
 **I need a break [.pause]:** You are taking a break during your lunch or dinner. Place your fork on the left border and your knife on the right border pointing to the center of the plate.
 
 **Do not take the plate [.doNotTake]:** Inform the waiter to keep your plate on the table. Place your fork and knife in the center of the place forming an inverted 'V'.
 
 **I'm done [.done]:** Place your knife and fork together in the center of the plate pointing to your front to indicate that you have finished.
 
 **The meal was delicious [.delicious]:** In case you have finished your meal and you want to show that it was excellent you place your knife and fork pointing to the right.
 
 **I am ready for the next dish [.nextDish]:** In a meal with many courses, place your knife and fork in a cross on the plate with a fork pouting to the front and the knife pointing to the left.
 
 **The service was bad [.badService]:** Let the waiter know that you did not like the service placing your knife and fork forming a 'V'.

 **I would like to complain [.complain]:** After a bad service or unsatisfactory meal you can ask for the complaints book. Place you fork and knife in the center of the table pointing to you.

 **The dish was horrible [.horrible]:** After a bad service or unsatisfactory meal, you can ask for the complaints book. Place your fork and knife in the center of the plate pointing to you.

 **I loved it! I definitely will come back [.willComeBack]:** You really enjoy the service and food and want to say you will return more times? Place you fork above your knife on your right side pointing to your front in diagonal.
 */
//#-hidden-code
import UIKit
import PlaygroundSupport

PlaygroundPage.current.assessmentStatus = .fail(hints: ["You could call the function using '.delicious' to say the meal was good."], solution: "Do 'setRule(.delicious)'.")

func setRule(_ type: CutleryStatus) {
    sendValue(.string(type.rawValue))
}
//#-end-hidden-code
//Run the code to see how to place your cutlery.
setRule(/*#-editable-code*/.delicious/*#-end-editable-code*/)
//:Now your are ready for that special dinner. Enjoy!
//: [**Previous Page**](@previous)

