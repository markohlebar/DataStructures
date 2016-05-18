//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Marko Hlebar on 19/04/2016.
//  Copyright © 2016 Marko Hlebar. All rights reserved.
//

import Foundation

class BinaryTreeNode<T:Comparable>: DataNode<T> {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    override init(data: T?) {
        super.init(data: data)
    }
    
    func count() -> UInt {
        var count: UInt = 1
        
        if left != nil {
            count = count + left!.count()
        }
        
        if right != nil {
            count = count + right!.count()
        }
        
        return count
    }
}

class BinarySearchTree<T:Comparable> {
    
    typealias Node = BinaryTreeNode<T>
    
    var root: Node?
    
    init(tree: BinarySearchTree? = nil) {
        
    }
    
    func isEmpty() -> Bool {
        return root == nil
    }
    
    func count() -> UInt {
        if isEmpty() {
            return 0
        }
        
        return root!.count()
    }
    
    func append(data: T) {
        if root == nil {
            root = Node(data: data)
            return
        }
        
        let node = root
        if node?.left == nil {
            node?.left = Node(data: data)
        }
        
//        var node = root
//        while node != nil {
//            if node?.left == nil {
//                node?.left = Node(data: data)
//            }
//        }
    }
}