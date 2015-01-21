//
//  ShortestPathTests.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

import XCTest

class ShortestPathTests: XCTestCase {
    
    let graph = Graph()
    let S = Vertex("s")
    let V = Vertex("v")
    
    override func setUp() {
        super.setUp()
        
        let U = Vertex("u")
        let X = Vertex("x")
        let Y = Vertex("y")
        
        graph.addVertices(S, U, X, V, Y)
        
        graph.addEdgeFrom(S, to: U, weight: 10)
        graph.addEdgeFrom(S, to: X, weight: 5)
        graph.addEdgeFrom(Y, to: S, weight: 7)
        graph.addEdgeFrom(V, to: Y, weight: 4)
        graph.addEdgeFrom(U, to: V, weight: 1)
        graph.addEdgeFrom(X, to: V, weight: 9)
        graph.addEdgeFrom(Y, to: V, weight: 6)
        graph.addEdgeFrom(X, to: U, weight: 3)
        graph.addEdgeFrom(X, to: Y, weight: 2)
        graph.addEdgeFrom(U, to: X, weight: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBellman_Ford() {
        let result = Bellman_Ford(graph, S)
        XCTAssert(result[V]!.weight == 9, "Bellman-Ford calculates minimum path from S to V")
    }
    
    func testFIFO_Bellman_Ford() {
        let result = FIFO_Bellman_Ford(graph, S)
        XCTAssert(result[V]!.weight == 9, "Bellman-Ford calculates minimum path from S to V")
    }
}
