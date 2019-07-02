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

extension LinkedList{
    public func insertToEnd(pokemonID: Int){

        let pokemon = PokemonType.allCases[pokemonID]
        let pokeball = Pokeball(pokemon: pokemon, next: nil)

        if isEmpty{
            head = pokeball
            addHead(pokemonID: pokemonID)
            return
        }

        if head != nil && tail == nil{
            tail = pokeball
            head!.next = tail
            addTail(pokemonID: pokemonID)
            return
        }

        tail?.next = pokeball

        tail = pokeball
        addNormal(pokemonID: pokemonID)
    }
}

//#-end-hidden-code
/*:
 # Let's remove the last pokemon!
 
 Wonderfull! You know how to a add new pokeball(node) now. Let's move to another functionality, **removing pokeball**.
 
 Let's write the logic to remove a node (pokeball):
 1. Check if pokelist is empty. If so, show alert to warn the user.
 2. If there is only one pokeball, set **head** as **nil**.
 3. If there are two pokeballs, set **tail** as **nil**.
 4. Otherwise, find the pokeball right before tail.
 5. Finally, set as tail that you found pokeball in step 4.
 
 I know, it's a little bit complicated. Let's see how it works `step 1 to step 4`:
 
  ![add node](remove-1.png)
 
 Then, `step 4 to 5` can be shown as:
 
  ![add node](remove-2.png)
 
 Great! It's time to write code ⌨️
*/
extension LinkedList{
    public func removeFromEnd(){
        //step 1
        if isEmpty {
            //#-hidden-code
            alert()
            //#-end-hidden-code
            return
        }
        //step 2
        if head != nil && head!.next == nil{
            head = nil
            //#-hidden-code
                removeHead()
            //#-end-hidden-code
            return
        }
        //Step 3
        if head?.next === tail{
            tail = nil
            head!.next = nil
            //#-hidden-code
                removeTail()
            //#-end-hidden-code
            return
        }
        //Step 4
        var custom = head
        while custom?.next?.next != nil {
            custom = custom!.next
        }
        //Step 5
        custom!.next = nil
        tail = custom!
        //#-hidden-code
        remove()
        //#-end-hidden-code
    }
}
/*:
- Callout(AR Time):
   Great! Now call `insertToEnd` and `removeFromEnd` functions **several** times!
*/
//#-code-completion(everything, hide)
//#-code-completion(description, show, "removeFromEnd()")
//#-code-completion(description, show, "insertToEnd(pokemonID: Int)")
//#-editable-code type your code
var pokelist = LinkedList()
pokelist.insertToEnd(pokemonID: 0)
pokelist.insertToEnd(pokemonID: 1)
pokelist.insertToEnd(pokemonID: 2)
pokelist.insertToEnd(pokemonID: 3)
pokelist.removeFromEnd()
pokelist.removeFromEnd()
pokelist.removeFromEnd()
pokelist.removeFromEnd()
pokelist.removeFromEnd()
//#-end-editable-code
