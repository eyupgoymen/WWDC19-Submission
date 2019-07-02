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

extension LinkedList {
    public func insertToFront(pokemonID: Int){
        let pokemon = PokemonType.allCases[pokemonID]
        let pokeball = Pokeball(pokemon: pokemon, next: nil)
        if isEmpty{
            head = pokeball
            addFrontHead(pokemonID: pokemonID)
            return
        }
        
        if head != nil && head!.next == nil{
            
            let temp = head
            head = pokeball
            tail = temp
            head!.next = tail
            addFrontTail(pokemonID: pokemonID)
            return
        }
        let temp = head
        head = pokeball
        head!.next = temp
        addFrontNormal(pokemonID: pokemonID)
    }
}
//#-end-hidden-code
/*:
 # Let's remove pokemon from front!
 
 So far so good, right? We have reached the last step at linked list for this playground. Let's move on to the last functionality, **remove pokeball from front**.
 

 Let's look at the logic to insert a node (pokeball) to front:
 1. Check if pokelist is empty. Show alert that says there is no pokemon to delete.
 2. If there is only one pokeball, set **head** as **nil**.
 3. If there are two pokeballs, set **tail** as **new head**.
 4. Otherwise, set **head.next** as **new head**, remove **old head**.
 
 I believe it's clear for you. Let's review what's happening below:
 
  ![remove node](removeEnd-1.png)
 
 Great! 🔉 Coding time!
*/
extension LinkedList{
    public func removeFromFront(){
        //Step 1
        if isEmpty{
            //#-hidden-code
            alert()
            //#-end-hidden-code
            return
        }
        //Step 2
        if head != nil && tail == nil{
            head = nil
            //#-hidden-code
            removeFrontHead()
            //#-end-hidden-code
            return
        }
        //Step 3
        if head != nil && head?.next === tail{
            head = tail
            tail = nil
            //#-hidden-code
            removeFrontTail()
            //#-end-hidden-code
            return
        }
        //Step 4
        head = head?.next
        //#-hidden-code
        removeFront()
        //#-end-hidden-code
    }
}
/*:
- Callout(AR Time):
  Awesome! Now call the `removeFromFront` function **several** times to remove pokemon! You can also use previous functions!
*/
//#-code-completion(everything, hide)
//#-code-completion(description, show, "removeFromEnd()")
//#-code-completion(description, show, "insertToEnd(pokemonID: Int)")
//#-code-completion(description, show, "insertToFront(pokemonID: Int)")
//#-code-completion(description, show, "removeFromFront()")
//#-editable-code type your code
var pokelist = LinkedList()
pokelist.insertToFront(pokemonID: 0)
pokelist.insertToFront(pokemonID: 1)
pokelist.insertToFront(pokemonID: 2)
pokelist.insertToFront(pokemonID: 3)
pokelist.removeFromFront()
//#-end-editable-code
