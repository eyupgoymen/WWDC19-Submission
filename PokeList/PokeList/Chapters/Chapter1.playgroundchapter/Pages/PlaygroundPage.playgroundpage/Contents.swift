//#-hidden-code
import Foundation
import PlaygroundSupport

func showPokeball(pokemonID : Int){
    if pokemonID == 1 || pokemonID == 2 || pokemonID == 3 || pokemonID == 0 {
       PlaygroundPage.current.assessmentStatus = .pass(message: "Great job! Pokeball will appear 1 meter in front of you.")
       loadScene(pokemonID: pokemonID)
    } else {
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Pokemon id's must between **0-3**. Take a look to PokemonType"], solution: "showPokeball(pokemonID: 0)")
    }
}
//#-end-hidden-code
/*:
 # Let's start with a quick definition!

 - Callout(Definition):
    Linked list is a linear data structure that is consisted of several **nodes**. The bottom line of linked list means that each node holds a value and reference of the next node.
 
 Before creating linked list structure, we need to create a node structure. In my journey, each node is going to be a pokeball.
 
 Basically, we are going to hold two things in pokeballs:
  * a pokemon
  * reference of next pokeball
 
*/
public class Pokeball {
    public var pokemon: PokemonType
    public var next: Pokeball?
    
    // initializer
    public init(pokemon: PokemonType, next: Pokeball? = nil){
        self.pokemon = pokemon
        self.next = next
    }
}

/*:
 
 Great! We created our Pokeball! 🤞🏻
 
 As you can see, each pokeball has a pokemon type. Now, let me show you my pokemons!!!
*/

public enum PokemonType: Int, CaseIterable {
    case Pikachu = 0
    case Bulbasaur = 1
    case Charmander = 2
    case Squirtle = 3
}
/*:
 
 So far, I have catched cute pokemons. Can you guess which one is my favorite? Yess, It's *Squirtle*.
 
 So far, we have done a lot of stuff! It's time to see our pokemon in real world!!!
 
 - Callout(AR Time):
   In order to activate AR and see pokeball, call `showPokeball(pokemonID: Int)` function. In order to see what is inside, just touch to ball 👆🏻
 */
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, showPokeball(pokemonID:))
//#-editable-code type your code
showPokeball(pokemonID: 3)
//#-end-editable-code



