//
//  ArViewController+Layout.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 10.02.2019.
//

import UIKit
import ARKit
import SceneKit

public extension ARViewController{
    func setAllViews(){
        setSceneViewLayout()
        setPokemonImageView()
        setPokemonBubbleAndTitle()
        setPokemonHeadTitle()
        setTerminal()
    }
    
     func setSceneViewLayout(){
        self.view.addSubview(sceneView)
        self.sceneView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.sceneView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.sceneView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.sceneView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    func setPokemonImageView(){
        self.view.addSubview(pokemonImageView)
        self.pokemonImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        self.pokemonImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 170).isActive = true
        self.pokemonImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.pokemonImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setPokemonBubbleAndTitle(){
        self.view.addSubview(bubbleImageView)
        self.bubbleImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 60).isActive = true
        self.bubbleImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        self.bubbleImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.bubbleImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setPokemonHeadTitle(){
        self.view.addSubview(headLabel)
        self.headLabel.centerYAnchor.constraint(equalTo: bubbleImageView.centerYAnchor,constant: -10).isActive = true
        self.headLabel.centerXAnchor.constraint(equalTo: bubbleImageView.centerXAnchor).isActive = true
        self.headLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setTerminal(){
        self.view.addSubview(logTextView)
        self.logTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.logTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        self.terminalWidth = logTextView.widthAnchor.constraint(equalToConstant: 280)
        self.terminalHeight = logTextView.heightAnchor.constraint(equalToConstant: 160)
        terminalHeight.isActive = true
        terminalWidth.isActive = true
        
        self.view.addSubview(terminalTopView)
        terminalTopView.widthAnchor.constraint(equalTo: logTextView.widthAnchor).isActive = true
        terminalTopView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        terminalTopView.centerXAnchor.constraint(equalTo: logTextView.centerXAnchor).isActive = true
        terminalTopView.bottomAnchor.constraint(equalTo: logTextView.topAnchor).isActive = true
        
        self.view.addSubview(terminalTitle)
        terminalTitle.centerXAnchor.constraint(equalTo: terminalTopView.centerXAnchor).isActive = true
        terminalTitle.centerYAnchor.constraint(equalTo: terminalTopView.centerYAnchor).isActive = true
        
        self.view.addSubview(extendButton)
        extendButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        extendButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        extendButton.leftAnchor.constraint(equalTo: logTextView.leftAnchor, constant: 8).isActive = true
        extendButton.centerYAnchor.constraint(equalTo: terminalTitle.centerYAnchor).isActive = true
    }
}
