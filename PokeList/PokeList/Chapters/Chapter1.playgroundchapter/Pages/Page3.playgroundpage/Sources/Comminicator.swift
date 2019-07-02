import PlaygroundSupport
import Foundation

let page = PlaygroundPage.current

public func addHead(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page3/addHead"),
            "pokemonID": PlaygroundValue.integer(pokemonID),
            ])
        proxy.send(command)
    }
}

public func addTail(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page3/addTail"),
            "pokemonID": PlaygroundValue.integer(pokemonID),
            ])
        proxy.send(command)
    }
}

public func addNormal(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page3/addNormal"),
            "pokemonID": PlaygroundValue.integer(pokemonID),
            ])
        proxy.send(command)
    }
}
