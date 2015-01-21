//
//  Graph.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

public class Graph {
    private(set) var canvas = [Vertex]()
    private(set) var edges = [Edge]()
    
    func addVertex(vertex: Vertex) {
        canvas.append(vertex)
    }
    
    func addVertices(vertices: Vertex...) {
        vertices.map(addVertex)
    }
    
    func addEdgeFrom(source: Vertex, to: Vertex, weight: Int) {
        var edge = Edge(from: source, to: to, weight: weight)
        edges.append(edge)
    }
}