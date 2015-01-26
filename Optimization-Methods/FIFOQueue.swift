//
//  FIFOQueue.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 24/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

/// Basic node structure for linked lists
private class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

/// First in First out queue implemented using a linked list
class FIFOQueue<T: Equatable>: GeneratorType {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    var isEmpty: Bool { return head == nil }
    
    /// Adds a value to the end of the queue in O(1)
    func enqueue(value: T) {
        let node = Node(value)
        
        if head == nil {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
    }
    
    /// Removes the value at the head of the queue and returns it in O(1).
    /// Returns nil if queue is empty.
    func dequeue() -> T? {
        if let node = head {
            head = node.next
            return node.value
        }
        return nil
    }
    
    func next() -> T? {
        return dequeue()
    }
    
    /// Returns true if the queue contains the given object. O(number of elements in queue)
    func contains(e: T) -> Bool {
        var next = head
        do {
            if next?.value == e { return true }
            next = next?.next
        } while next != nil
        return false
    }
}

extension FIFOQueue: SequenceType {
    typealias Generator = FIFOQueue
    func generate() -> Generator {
        return self
    }
}