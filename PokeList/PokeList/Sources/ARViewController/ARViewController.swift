//
//  ARViewController.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 26.01.2019.
//

import Foundation
import UIKit
import ARKit
import SceneKit

public final class ARViewController: UIViewController{
    
    var configuration = ARWorldTrackingConfiguration()
    var sceneView = ARSCNView()
    
    //Head pointer variables - I use them to move while either adding or removing nodes, animations
    var headPointer: Pointer?
    var tailPointer: Pointer?
    
    //head and tail pokeballs - It's used to get first and last location of list
    var headPokeball: PokeballNode?
    var tailPokeball: PokeballNode?
    
    //head and tail pointer positions
    var headPointerPosition = location(0,0,0)
    var tailPointerPosition = location(0,0,0)
    
    // linked list structures to store pokeballs, pokemons and pointers.
    var pokeballList = LinkedList<PokeballNode>()
    var pokemonList = LinkedList<PokemonNode>()
    var pointerList = LinkedList<Pointer>()
    
    //Delay time is used for delation in animations.
    var delayTime: Double = 10
    
    
    //UI implementations
    let headLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 3
        label.textAlignment = .left
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bubbleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bubble")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: PokemonType.Squirtle.imageName)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Terminal views
    lazy var logTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tv.textColor = #colorLiteral(red: 0.4638870358, green: 0.8374367356, blue: 0.9793421626, alpha: 1)
        tv.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 6, borderColor: UIColor.green, borderWidth: 0)
        tv.text = "~ \(self.getDate()): Log started. Welcome to pokelist."
        tv.isUserInteractionEnabled = true
        tv.isEditable = false
        tv.alpha = 0.8
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let terminalTopView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2692848117, green: 0.271950998, blue: 0.271950998, alpha: 1)
        v.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 6, borderColor: UIColor.green, borderWidth: 0)
        v.isUserInteractionEnabled = false
        v.alpha = 0.8
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let terminalTitle: UILabel = {
        let t = UILabel()
        t.textColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        t.text = "PokeList Log"
        t.alpha = 0.8
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let extendButton: UIButton = {
        let b = UIButton()
        b.layer.cornerRadius = 8
        b.addTarget(self, action: #selector(extendPressed), for: .touchUpInside)
        b.setImage(UIImage(named: "extend"), for: .normal)
        b.alpha = 0.8
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    //Variables to extend terminal in the screen
    var terminalWidth: NSLayoutConstraint!
    var terminalHeight: NSLayoutConstraint!
    var isTerminalExtended = false
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        sceneView = ARSCNView(frame: view.frame)
        setAllViews()
        configureSceneView()
        addTapGestureRecognizer()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    //Set sceneView
    private func configureSceneView(){
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    //Tap gesture, in order to open and close the pokeball in the scene
    private func addTapGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pokeballTapped))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //Show loader while scene is loading.
    public func showLoader(){
        let vc = LoaderViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
        
        runAfter(time: 1.4) {
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    public func resetSceneView(){
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    public func runAfter(time: Double, action: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            action()
        }
    }
    
    //Get date for terminal
    func getDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        let stringDate = formatter.string(from: date)
        return stringDate
    }
    
    //Executes when terminal extends or vice versa.
    @objc
    func extendPressed(){
        if !isTerminalExtended{
            terminalWidth.constant = 350
            terminalHeight.constant = 260
        } else {
            terminalWidth.constant = 280
            terminalHeight.constant = 160
        }
        
        isTerminalExtended.toggle()
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //Add new command to terminal
    func insertCommandToTerminal(command: String,newLine: Bool = false){
        let date = getDate()
        
        //Move cursor to bottom
        if newLine{
            logTextView.text += "\n\n~ \(date): \(command)"
        } else {
            logTextView.text += "\n~ \(date): \(command)"
        }
        
        let bottom = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(bottom)
    }
}
