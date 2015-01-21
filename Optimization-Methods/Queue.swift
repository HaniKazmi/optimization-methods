//
//  Queue.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

class Queue<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    var isEmpty: Bool { return head == nil }
    
    func enqueue(value: T) {
        let node = Node(value)
        
        if head == nil {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
    }
    
    func dequeue() -> T? {
        if let node = head {
            head = node.next
            return node.value
        }
        return nil
    }
    
    func contains(e: T) -> Bool {
        var next = head
        do {
            if next?.value == e { return true }
            next = next?.next
        } while next != nil
        return false
    }
}
