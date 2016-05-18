//
//  LinkedList.swift
//  DataStructures
//
//  Created by Marko Hlebar on 16/04/2016.
//  Copyright © 2016 Marko Hlebar. All rights reserved.
//

import Foundation

class LinkedListNode<T:Equatable>: DataNode<T>  {
    var next: LinkedListNode?
    
    override init(data: T?) {
        super.init(data: data)
    }
}

class LinkedList<T:Equatable> {
    typealias Node = LinkedListNode<T>
    var head: Node?
    var tail: Node?
    
    init(list: LinkedList? = nil) {
        guard list != nil else {
            return
        }
        
        for element in list! {
            self.append(element)
        }
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func append(data: T) {
        let node = Node(data: data)

        if isEmpty() {
            head = node
        }
        else {
            tail?.next = node
        }
        
        tail = node
    }
    
    func remove(data: T) {
        iterateNodes { node, _ -> Bool in
            if node === self.head && node.data == data {
                self.head = self.head?.next
            }
            
            if let next = node.next {
                if next.data == data {
                    node.next = next.next
                }
            }
            return true
        }
    }
    
    func find(data: T) -> Node? {
        var foundNode: Node?
        iterateNodes { node, _ in
            if node.data == data {
                foundNode = node
            }
            return foundNode == nil
        }
        return foundNode
    }
    
    func count() -> UInt {
        guard !isEmpty() else {
            return 0
        }
        
        var count = 0 as UInt
        iterateNodes { _ in
            count = count + 1
            return true
        }
        return count
    }
    
    func objectAtIndex(index: UInt) ->  T? {
        guard index < count() else {
            return nil
        }
        
        var foundNode: Node?
        iterateNodes { (node, i) -> Bool in
            foundNode = node
            return i != index
        }
        
        return foundNode?.data        
    }
    
    subscript(index: UInt) -> T? {
        return objectAtIndex(index)!
    }
    
    private func iterateNodes(callback: (Node, UInt) -> Bool) {
        var node: Node? = head
        var index = UInt(0)
        
        while (node != nil) {
            if callback(node!, index) {
                node = node!.next
            }
            else {
                break
            }
            
            index = index + 1
        }
    }
}

extension LinkedList : SequenceType {
    typealias Generator = AnyGenerator<T>
    
    func generate() -> Generator {
        var node = self.head
        return AnyGenerator {
            guard node != nil else {
                return nil
            }
            let data = node?.data
            node = node?.next
            return data
        }
    }
}

extension LinkedList {
    func reverse() -> LinkedList {
        let list = LinkedList(list: self)
        
        var headNext: Node? = nil
        var next:Node? = nil
        
        repeat {
            next = list.head!.next                  //B           //C           //nil
            list.head!.next = headNext              //nil         //A           //B
            headNext = list.head                    //A           //B           //C
            if next != nil {list.head = next}       //B           //C           //nil
        } while next != nil
        
        return list
    }
}
