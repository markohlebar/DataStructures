//
//  RadixTree.swift
//  RadixTree
//
//  Created by Marko Hlebar on 04/05/2016.
//  Copyright © 2016 Paddy Power. All rights reserved.
//

import Foundation

class RadixTreeNode: DataNode<String> {
    var link: RadixTreeNode?
    var next: RadixTreeNode?
    
    override init(data: String?) {
        super.init(data: data)
    }
}

extension RadixTreeNode {
    typealias Node = RadixTreeNode

    func find(root: Node, x: String) -> Node? {
        let xLength = x.characters.count
        let k = prefixLength(x, data: root.data!)
        
        if k == 0 {
            return find(root.next!, x: x)
        }
        else if k == xLength {
            return root
        }
        else if k == root.data?.characters.count {
            return find(root.link!, x: x.substringFromIndex(x.startIndex.advancedBy(k)))
        }
        
        return nil
    }
    
    func append(root: Node?, x: String) -> Node {
        guard root != nil else {
            return Node(data: x)
        }
        
        let n = x.characters.count
        
        let k = prefixLength(x, data: (root?.data)!)
        
        if k == 0 {
            root?.next = append(root?.next, x: x)
        }
            
        else if (k < n) {
            if (k < root?.data?.characters.count) {
                split(root!, k: k)
            }
            
            let index = x.startIndex.advancedBy(k)
            root?.link = append(root?.link, x: x.substringFromIndex(index))
        }
        
        return root!
    }
    
    func remove(root: Node?, x:String) -> Node? {
        guard root != nil else {
            return nil
        }
        
        let n = x.characters.count
        let k = prefixLength(x, data: (root?.data)!)
        
        if(k == n) {
            return root?.next
        }
        
        if(k == 0) {
            root?.next = remove(root?.next, x: x)
        }
        else if k == root?.data?.characters.count {
            let index = x.startIndex.advancedBy(k)
            root?.link = remove(root?.link, x: x.substringFromIndex(index))
            if root?.link != nil && root?.link?.next == nil {
                join(root!)
            }
        }
        
        return root
    }
    
    private func split(root: Node, k: Int) {
        let rootdata = root.data!
        let index = rootdata.startIndex.advancedBy(k)
        let pdata = rootdata.substringFromIndex(index)
        let p = Node(data: pdata)
        p.link = root.link
        root.link = p
        root.data = rootdata.substringToIndex(index)
    }
    
    private func prefixLength(x: String, data: String) -> Int {
        let xLength = x.characters.count
        let dataLength = data.characters.count
        
        for index in 0...xLength {
            let xIndex = x.startIndex.advancedBy(index)
            let dataIndex = data.startIndex.advancedBy(index)
            
            if index == dataLength || x[xIndex] != data[dataIndex] {
                return index
            }
        }
        
        return xLength
    }
    
    private func join(root: Node) {
        let p = root.link!
        root.data = root.data! + p.data!
        root.link = p.link
    }
}

class RadixTree {
    typealias Node = RadixTreeNode

    var root: Node?
    
    init(tree: RadixTreeNode? = nil) {
    }
    
    func find(data: String) -> Node? {
        return root?.find(root!, x: data)
    }
    
    func append(data: String) {
        root = root?.append(root!, x: data)
    }
    
    func remove(data: String) {
        root = root?.remove(root!, x: data)
    }
}
