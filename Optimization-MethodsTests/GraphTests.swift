//
//  GraphTests.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

import XCTest

class GraphTests: XCTestCase {

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
        XCTAssert(true, "Graph is created")
    }
}
