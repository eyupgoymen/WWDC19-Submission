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

extension LinkedList{
    public func removeFromEnd(){
        if isEmpty {
            alert()
            return
        }

        if head != nil && head!.next == nil{
            head = nil
            removeHead()
            return
        }
  
        if head?.next === tail{
            tail = nil
            head!.next = nil
            removeTail()
            return
        }
        
        var custom = head
        while custom?.next?.next != nil {
            custom = custom!.next
        }
     
        custom!.next = nil
        tail = custom!
        remove()
    }
}
//#-end-hidden-code
/*:
 # Let's insert pokemon to front!
 
 I think, you are familiar with my pokelist and all linked list structure so far. We move on step by step! Now, we can move to another functionality, **insert pokeball to front**
 
 Let's write the logic to insert a node (pokeball) to front:
 1. Create given pokeball and pokemon.
 2. Check if pokelist is empty. If so, set the new pokeball as **head**.
 3. If there is only one pokeball, set the new pokemon as **tail**.
 4. Otherwise, hold old head pokeball temporarily, set new one as **head** and set **next** to **old head**.
 
 Looks easy, right? Yep, let me sum up them in an image: 
 
  ![add node](addFront-1.png)
 
 It's clear, right? 🔉 Coding time!
*/
extension LinkedList {
    public func insertToFront(pokemonID: Int){
        //Step 1
        let pokemon = PokemonType.allCases[pokemonID]
        let pokeball = Pokeball(pokemon: pokemon, next: nil)
        //Step 2
        if isEmpty{
            head = pokeball
            //#-hidden-code
            addFrontHead(pokemonID: pokemonID)
            //#-end-hidden-code
            return
        }
        
        //Step 3
        if head != nil && head!.next == nil{
       
            let temp = head
            head = pokeball
            tail = temp
            head!.next = tail
            //#-hidden-code
            addFrontTail(pokemonID: pokemonID)
            //#-end-hidden-code
            
            return
        }
        
        //Step 4
        let temp = head
        head = pokeball
        head!.next = temp
        //#-hidden-code
        addFrontNormal(pokemonID: pokemonID)
        //#-end-hidden-code
    }
}
/*:
- Callout(AR Time):
  Great! Now call `insertToFront(pokemonID: Int)` function **several** times to add pokemon! You can also use previous functions!
*/
//#-code-completion(everything, hide)
//#-code-completion(description, show, "removeFromEnd()")
//#-code-completion(description, show, "insertToEnd(pokemonID: Int)")
//#-code-completion(description, show, "insertToFront(pokemonID: Int)")
//#-editable-code type your code
var pokelist = LinkedList()
pokelist.insertToFront(pokemonID: 0)
pokelist.insertToFront(pokemonID: 1)
pokelist.insertToFront(pokemonID: 2)
pokelist.insertToFront(pokemonID: 2)
pokelist.removeFromEnd()
//#-end-editable-code
