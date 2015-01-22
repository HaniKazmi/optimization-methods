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
        XCTAssert(result[V]!.weight == 9, "FIFO Bellman-Ford calculates minimum path from S to V")    }
    
    func testDijkstra() {
        let result = Dijkstra(graph, S)
        XCTAssert(result[V]!.weight == 9, "Dijkstra calculates minimum path from S to V")
    }
    
    func testSingleSourceShortestPath() {
        let DAC = Graph()
        
        let start = Vertex("start")
        let A = Vertex("A")
        let B = Vertex("B")
        let C = Vertex("C")
        let D = Vertex("D")
        let E = Vertex("E")
        let F = Vertex("F")
        let G = Vertex("G")
        let H = Vertex("H")
        let P = Vertex("P")
        let Q = Vertex("Q")
        let end = Vertex("end")
        
        DAC.addVertices(start, A, B, C, D, E, F, G, H, P, Q, end)
        
        DAC.addEdgeFrom(start, to: B, weight: 4)
        DAC.addEdgeFrom(start, to: A, weight: 3)
        DAC.addEdgeFrom(start, to: E, weight: 1)
        DAC.addEdgeFrom(B, to: C, weight: 3)
        DAC.addEdgeFrom(A, to: C, weight: 5)
        DAC.addEdgeFrom(A, to: G, weight: 4)
        DAC.addEdgeFrom(E, to: G, weight: 5)
        DAC.addEdgeFrom(C, to: D, weight: 4)
        DAC.addEdgeFrom(C, to: P, weight: 6)
        DAC.addEdgeFrom(G, to: C, weight: 3)
        DAC.addEdgeFrom(G, to: H, weight: 5)
        DAC.addEdgeFrom(D, to: F, weight: 2)
        DAC.addEdgeFrom(D, to: P, weight: 3)
        DAC.addEdgeFrom(P, to: end, weight: 6)
        DAC.addEdgeFrom(P, to: Q, weight: 1)
        DAC.addEdgeFrom(H, to: P, weight: 3)
        DAC.addEdgeFrom(H, to: Q, weight: 7)
        DAC.addEdgeFrom(F, to: end, weight: 4)
        DAC.addEdgeFrom(Q, to: end, weight: 3)
        
        let result = SingleSourceShortestPath(DAC, start)
        XCTAssert(result[end]!.weight == 17, "Single Source calculates minimum path from S to V")
    }
}
