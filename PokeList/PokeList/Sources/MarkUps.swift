//Bold text                                                    **This is bold text**

//Italic text                                                  *This is italic one*

//Next page                                                    [next page](@next)

//Adding Image                                                 ![image_description](imagename.extension)

//Sending value to live view                                   let page = PlaygroundPage.current
//                                                             if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy{
//                                                                  proxy.send(.string(message))
//                                                             }

//Hidden Code                                                  //#-hidden-code
//                                                             //#-end-hidden-code

//Add shortcut                                                 //#-code-completion(everything, hide)
//                                                             //#-code-completion(identifier, show, x())
 
//Editable Function                                            func /*#-editable-code*/ <#funcName#> /*#-end-editable-code*/ {
//                                                                  /*#-editable-code*/ Add Your Code here
//                                                                  /*#-end-editable-code*/
//                                                             }

//Editable Code                                                /*#-editable-code*/
//                                                             /*#-end-editable-code*/

//Page Status                                                  page.assessmentStatus = .pass(message: "You passed.[**Next Page**](@next)")

//Title                                                        #This is title

//New Line                                                     This is written in\new line
 
//Important                                                    - Important:

//Special                                                      `funcName`
 
//Add Glossary                                                 [`Ash`](glossary://Ash)

//Send dictionary to liveView                                  func addPokemon(_ type: PokemonType){
//                                                                 if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
//                                                                     let  command: PlaygroundValue = .dictionary([
//                                                                         "Command": .string("addPokemon"),
//                                                                         "pokemonType": PlaygroundValue.string(type.rawValue)
//                                                                         ])
//                                                                     proxy.send(command)
//                                                                 }
//                                                             }

//Catch dictionary in liveView                                 extension ViewController: PlaygroundLiveViewMessageHandler{
//                                                                    public func receive(_ message: PlaygroundValue){
//                                                                        switch message{
//                                                                        case let .dictionary(dictionary):
//                                                                            guard case let .string(pokemonType)? = dictionary["pokemonType"] else {
//                                                                                return
//                                                                            }
//                                                                            label.text = pokemonType
//                                                                        default:
//                                                                            break
//                                                                        }
//                                                                    }
//                                                              }
