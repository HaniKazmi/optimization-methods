//
//  GraphTests.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

import XCTest

class ModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGraphCreation() {
        var graph = Graph()
        
        var A = Vertex("A")
        var B = Vertex("B")
        var C = Vertex("C")
        
        graph.addVertex(A)
        graph.addVertices(B, C)
        
        graph.addEdgeFrom(A, to: B, weight: 5)
        graph.addEdgeFrom(A, to: C, weight: 10)
        XCTAssert(graph.canvas.count == 3, "Graph is created")
        XCTAssert(graph.edges.count == 2, "All edges present")
    }
    
    func testQueue() {
        let queue = Queue<Int>()
        
        XCTAssertNil(queue.dequeue(), "Queue starts empty")
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssert(queue.contains(1), "Can check if queue contains element")
        XCTAssert(queue.contains(2), "Can check if queue contains element")
        XCTAssert(queue.contains(3), "Can check if queue contains element")
        XCTAssertFalse(queue.contains(5), "Can check if queue contains element")
        
        XCTAssert(queue.dequeue() == 1, "First element removed")
        XCTAssert(queue.dequeue() == 2, "Second element removed")
        XCTAssert(queue.dequeue() == 3, "Last element removed")
        XCTAssertNil(queue.dequeue(), "Queue is empty")
    }
    
    func testPriorityQueue() {
        let pQueue = PriorityQueue<Int, String>()
        
        XCTAssertNil(pQueue.pop(), "Queue starts empty")
        
        pQueue.push(3, value: "Hello")
        pQueue.push(1, value: "Bye")
        
        XCTAssert(pQueue.pop() == "Bye", "Minimum item popped")
        
        pQueue.push(5, value: "Howdy")
        pQueue.push(2, value: "Test")
        XCTAssert(pQueue.pop() == "Test", "Minimum item popped")

        pQueue.decreaseKey("Howdy", to: 2)
        XCTAssert(pQueue.pop() == "Howdy", "Minimum item popped after decreaseKey")
        XCTAssert(pQueue.pop() == "Hello", "Minimum item popped")
        
        XCTAssertNil(pQueue.pop(), "Queue ends empty")
    }
}
