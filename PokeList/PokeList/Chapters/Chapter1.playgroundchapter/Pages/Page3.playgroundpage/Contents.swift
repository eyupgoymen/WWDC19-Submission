//#-hidden-code
import Foundation
import PlaygroundSupport

public enum PokemonType: Int, CaseIterable {
    case Pikachu = 0
    case Bulbasaur
    case Charmander
    case Squirtle
}

public class Pokeball {
    public var pokemon: PokemonType
    public var next: Pokeball?
    
    // initializer
    public init(pokemon: PokemonType, next: Pokeball? = nil){
        self.pokemon = pokemon
        self.next = next
    }
}

public class LinkedList{
    public var head: Pokeball? = nil
    public var tail: Pokeball? = nil
    
    public init(){ }
    
    public var isEmpty: Bool {
        return head == nil
    }
}
//#-end-hidden-code
/*:
 # Let's insert a pokeball to end!
 
 So far, we havecreated all basic structures for linked list. Now, It's time to **add node**(pokeball) to my pokelist 🤞🏻
 
 Let's write the logic in order to insert a node (pokeball):
 1. We are going to create our node.
 2. If linked list (pokelist) is already empty, then insert node and set as **head** and return.
 3. If linked list has one item, set new pokeball as **tail** and return.
 4. For that last pokeball, we'll set next pokeball to next pokemon that we created in the first step.
 5. Then, set new pokeball as **tail**.
 
 Mmm, it is possible that could be unclear. Let me show you `step 1 to step 4`:
 
  ![add node](add-1.png)
 
 Then, `step 4 to 5` can be shown as:
 
  ![add node](add-2.png)
 
 It makes sense! It's time to write the code ⌨️
 */
extension LinkedList{
    // We have new function inside - linked list
    public func insertToEnd(pokemonID: Int){
        //step 1
        let pokemon = PokemonType.allCases[pokemonID]
        let pokeball = Pokeball(pokemon: pokemon, next: nil)
        // step 2
        if isEmpty{
            head = pokeball; return
            //#-hidden-code
            addHead(pokemonID: pokemonID)
            //#-end-hidden-code
        }
        //step 3
        if head != nil && tail == nil{
            tail = pokeball
            head!.next = tail
            //#-hidden-code
            addTail(pokemonID: pokemonID)
            //#-end-hidden-code
            return
        }
        //step 4
        tail?.next = pokeball
        //step 5
        tail = pokeball
        //#-hidden-code
        addNormal(pokemonID: pokemonID)
        //#-end-hidden-code
    }
}
/*:
- Callout(AR Time):
   Great! Now call `insertToEnd` function **several** times to add pokemon! Pokemon id's **must** be between 0-3.
 
*/
//#-code-completion(everything, hide)
//#-code-completion(description, show, "insertToEnd(pokemonID: Int)")
//#-editable-code type your code
var pokelist = LinkedList()
pokelist.insertToEnd(pokemonID: 0)
pokelist.insertToEnd(pokemonID: 1)
pokelist.insertToEnd(pokemonID: 2)
pokelist.insertToEnd(pokemonID: 3)
//#-end-editable-code
