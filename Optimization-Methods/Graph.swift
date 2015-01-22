//
//  Graph.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

class Vertex: Hashable, Printable {
    let key: String
    var neighbours = [Edge]()
    var hashValue: Int { return key.hashValue }
    
    init(_ key: String) {
        self.key = key
    }
    
    var description: String { return key }
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

struct Edge: Printable {
    let from: Vertex
    let to: Vertex
    let weight: Int
    
    var description: String { return "\(from) \(to) \(weight)"}
}

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
        source.neighbours.append(edge)
    }
}