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
        let graph = Graph()
        
        var A = Vertex("A")
        var B = Vertex("B")
        var C = Vertex("C")
        
        graph.addVertex(A)
        graph.addVertices(B, C)
        
        graph.addEdgeFrom(A, to: B, weight: 5)
        graph.addEdgeFrom(A, to: C, weight: 10)
        XCTAssert(graph.vertices.count == 3, "Graph is created")
        XCTAssert(graph.edges.count == 2, "All edges present")
    }
    
    func testPerformanceGraphRemove() {
        let graph = Graph()
        
        for i in 0...10000 {
            graph.addVertex(Vertex(i.description))
        }
        let A = Vertex("A")
        graph.addVertex(A)
        
        self.measureBlock() {
            graph.removeVertex(A)
        }
    }
    
    func testQueue() {
        let queue = FIFOQueue<Int>()
        
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
        
        XCTAssertNil(pQueue.dequeue(), "Queue starts empty")
        
        pQueue.enqueue(3, value: "Hello")
        pQueue.enqueue(1, value: "Bye")
        
        XCTAssert(pQueue.dequeue() == "Bye", "Minimum item popped")
        
        pQueue.enqueue(5, value: "Howdy")
        pQueue.enqueue(2, value: "Test")
        XCTAssert(pQueue.dequeue() == "Test", "Minimum item popped")
        
        pQueue.decreaseKey("Howdy", to: 2)
        XCTAssert(pQueue.dequeue() == "Howdy", "Minimum item popped after decreaseKey")
        XCTAssert(pQueue.dequeue() == "Hello", "Minimum item popped")
        
        XCTAssertNil(pQueue.dequeue(), "Queue ends empty")
    }
    
    func testMatrix() {
        let matrix = Matrix<String, Int>()
        
        XCTAssertNil(matrix["hello", "bye"], "Accessing empty matrix returns nil")
        
        matrix["hello", "bye"] = 1
        XCTAssertNil(matrix["hello", "tan"], "Accessing empty matrix returns nil")
        XCTAssert(matrix["hello", "bye"] == 1, "Can access elements from the array")
        
        matrix["tan", "hello"] = 5
        XCTAssert(matrix["hello", "bye"] == 1, "Can access elements from the array")
    }
}
