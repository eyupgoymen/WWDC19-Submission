import PlaygroundSupport
import Foundation

let page = PlaygroundPage.current

public func loadScene(pokemonID_1: Int, pokemonID_2: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page2/loadScene"),
            "pokemonID_1": PlaygroundValue.integer(pokemonID_1),
            "pokemonID_2": PlaygroundValue.integer(pokemonID_2),
            ])
        proxy.send(command)
    }
}
