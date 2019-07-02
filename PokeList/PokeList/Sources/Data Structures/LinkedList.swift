//
//  Pokemon.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 16.02.2019.
//

import Foundation

public class Node<Value>{
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}

public struct LinkedList<Value>{
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init(){ }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func insertToEnd(value: Value){
        let newNode = Node(value: value)
        
        if isEmpty{
            head = newNode;
            return
        }
       
        if head != nil && tail == nil{
            tail = newNode
            head!.next = tail
            return
        }
        tail?.next = newNode
        tail = newNode
    }
    
    public mutating func removeFromEnd() -> (Node<Value>? ,Node<Value>?) {
        if isEmpty { return (nil,nil)}
        
        if head != nil && head!.next == nil{
            let temp = head
            head = nil;
            
            return (temp,nil)
        }
   
        if head?.next === tail{
            let temp = tail
            tail = nil
            head!.next = nil
            return (temp,nil)
        }

        var custom = head
        while custom?.next?.next != nil {
            custom = custom!.next
        }
        
        let temp = custom!.next
        custom!.next = nil
        tail = custom!
        
        return (temp,tail)
    }
    
    // deleted and next one
    public mutating func removeFromFront() -> (Node<Value>?,Node<Value>?){
       if isEmpty { return (nil,nil)}
        
        if head != nil && tail == nil{
            let temp = head
            head = nil
            return (temp,nil)
        }
        
        if head != nil && head?.next === tail{
            let temp = head
            head = tail
            tail = nil
            return (temp,head)
        }
        
        let temp = head
        head = head?.next
        return (temp,head)
    }
    
    public mutating func insertToFront(value: Value){
        let newNode = Node(value: value)
      
        if isEmpty{
            head = newNode
            return
        }
        
        if head != nil && head!.next == nil{
            let temp = head
            head = newNode
            tail = temp
            head!.next = tail
            return
        }
        
        let temp = head
        head = newNode
        head!.next = temp
    }
    
    public  func printAll() -> String{
        var custom = head
        var text = ""
        var counter = 1
        while custom != nil {
            let pokemon =  custom!.value as! PokemonNode
            text += "\n  \(counter)- \(pokemon.pokemonType.rawValue)"
            custom = custom?.next
            counter += 1
        }
        return text
    }
    
    public func printHeadAndTail() -> String{
        let tempHead = head
        let tempTail = tail
        
        var headValue = "empty"
        var tailValue = "empty"
        
        if let pokemonHead = tempHead?.value as? PokemonNode {
            headValue = pokemonHead.pokemonType.rawValue
        }
        
        if let pokemonTail = tempTail?.value as? PokemonNode {
            tailValue = pokemonTail.pokemonType.rawValue
        }
      
        return " head: \(tempHead == nil ? "empty" : headValue), tail: \(tempTail == nil ? "empty" : tailValue)"
    }
}
