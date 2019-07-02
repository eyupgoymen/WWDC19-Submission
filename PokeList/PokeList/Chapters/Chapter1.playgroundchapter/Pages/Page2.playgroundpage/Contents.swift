//#-hidden-code
import Foundation
import PlaygroundSupport

func showPokeballs(pokemonID_1: Int, pokemonID_2: Int){
    if (pokemonID_1 == 1 || pokemonID_1 == 2 || pokemonID_1 == 3 || pokemonID_1 == 0) && (pokemonID_2 == 1 || pokemonID_2 == 2 || pokemonID_2 == 3 || pokemonID_2 == 0) {
        PlaygroundPage.current.assessmentStatus = .pass(message: "Great job! Pokeballs will appear 1 meter in front of you. Do you see head and tail?")
        loadScene(pokemonID_1: pokemonID_1, pokemonID_2: pokemonID_2)
    } else {
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Pokemon id's must be between **0-3**. Take a look to PokemonType"], solution: "showPokeballs(pokemonID_1: 0, pokemonID_2: 2)")
    }
}
//#-end-hidden-code
/*:
 # Let's link my Pokeballs!

 In previos page, you saw my little, cute pokemon, right? But, I have more! Now, let's see more pokemons!
 
 So, how are we going to add several multiple pokeballs? how are we going to know where a specific pokemon is? Here, Linked list helps us connect our pokeballs!
 
 As you know, we have already implemented pokeballs. Now, it's a great time to create linked list structure for those balls.
 
 In order to create a linked list, we need two pokeballs:
 * a pokeball to reference `first` pokeball, called **head**.
 * a pokeball to reference `last` pokeball, called **tail**.
 */
public class LinkedList {
    public var head: Pokeball?
    public var tail: Pokeball?
    
    public init(){ }
    
    //If head is nil, then linked list empty!
    public var isEmpty: Bool {
        return head == nil
    }
}
/*:
 Great! We are ready to go 💫. So far, we have implemented all linked list structures. But, we don't have any functionalities yet.
 
 In this chapter, we are going to learn how to:
 1. Add pokeball at the end of list
 2. Remove pokeball at the end of list
 3. Add pokeball to beginning
 4. Remove pokeball from beginning
 
 Don't worry, we are going to cover all of them step by step,now let's see a quick introduction with augmented reality🔥
 
 - Callout(AR Time):
   Let's take a look to pokeballs. But this time, we are going to add two pokemon! Yeey! Call `showPokeballs(pokemonID_1: Int, pokemonID_2: Int)` to see pokeballs in real world! Then, execute the code!
*/
//#-code-completion(everything, hide)
//#-code-completion(description, show, "showPokeballs(pokemonID_1: Int, pokemonID_2: Int)")
//#-editable-code type your code
showPokeballs(pokemonID_1: 1, pokemonID_2: 3)
//#-end-editable-code
