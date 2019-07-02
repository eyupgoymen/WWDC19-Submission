import PlaygroundSupport
import Foundation

public class Pokeball {
    public var pokemon: PokemonType
    public var next: Pokeball?
    
    // initializer
    public init(pokemon: PokemonType, next: Pokeball? = nil){
        self.pokemon = pokemon
        self.next = next
    }
}
