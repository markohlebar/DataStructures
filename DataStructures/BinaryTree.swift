//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Marko Hlebar on 19/04/2016.
//  Copyright © 2016 Marko Hlebar. All rights reserved.
//

import Foundation

class BinaryTreeNode<T:Equatable>: DataNode<T> {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
}

class BinaryTree<T:Equatable> {
    
    typealias Node = BinaryTreeNode<T>
    
    
    
}