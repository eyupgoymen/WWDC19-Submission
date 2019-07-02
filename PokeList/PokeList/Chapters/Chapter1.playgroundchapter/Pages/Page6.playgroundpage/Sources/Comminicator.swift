import PlaygroundSupport
import Foundation

let page = PlaygroundPage.current

//To remove pokeballs from front
public func removeFront(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page6/remove")
            ])
        proxy.send(command)
    }
}

public func removeFrontHead(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page6/removeHead")
            ])
        proxy.send(command)
    }
    alert()
}

public func removeFrontTail(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page6/removeTail")
            ])
        proxy.send(command)
    }
}


//To insert to front
public func addFrontNormal(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page5/addNormal"),
            "pokemonID": PlaygroundValue.integer(pokemonID),
            ])
        proxy.send(command)
    }
}

public func addFrontHead(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page5/addHead"),
            "pokemonID": PlaygroundValue.integer(pokemonID),
            ])
        proxy.send(command)
    }
}

public func addFrontTail(pokemonID: Int){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Page5/addTail"),
            "pokemonID": PlaygroundValue.integer(pokemonID),
            ])
        proxy.send(command)
    }
}


//To remove pokeballs
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

public func test(){
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let  command: PlaygroundValue = .dictionary([
            "Command": .string("Test")
            ])
        proxy.send(command)
    }
}

