import PlaygroundSupport
import Foundation

let page = PlaygroundPage.current

public func loadScene(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page1/loadScene"),
            "pokemonID": PlaygroundValue.integer(pokemonID)
            ])
        proxy.send(command)
    }
}
