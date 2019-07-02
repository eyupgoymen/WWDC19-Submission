import PlaygroundSupport
import Foundation

let page = PlaygroundPage.current

public func remove(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page4/remove")
            ])
        proxy.send(command)
    }
}

public func alert(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page4/alert")
            ])
        proxy.send(command)
    }
}

public func removeHead(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page4/removeHead")
            ])
        proxy.send(command)
    }
}

public func removeTail(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page4/removeTail")
            ])
        proxy.send(command)
    }
}

//To add pokeballs
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
