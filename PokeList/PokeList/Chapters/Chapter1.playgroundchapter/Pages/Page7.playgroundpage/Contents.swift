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
//#-end-hidden-code
/*:
 # We are almost done!
 
We have learned bunch of functionalities and entire system of linked list, thanks to pokemons.
Not, it's great time to test what we have learned. In this page, you will use previous functions to make a given task.
But, this time, you will not have auto-comletion!

 Let's take a look those tasks
 1. Create a linked list, named as myList.
 2. Add to pikachu to end of the list.
 3. Add charmendar to beginning of the list.
 4. Add squirtle to end of the list.
 5. Remove the pokemon from the front.
 
 Look's easy right? Now, what I want to see is the head and tail nodes in the given order. Write their pokemon id's respectively.
 
 Great! Coding time!
*/

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
//Define your list here.


//Send the result with 'testResult(ids: )' function here.

//#-end-editable-code
