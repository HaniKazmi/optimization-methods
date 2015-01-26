//
//  Graph.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

/// Represents a node on a graph
class Vertex: Hashable, Printable {
    let key: String
    /// The adjaceny list for the vertex
    var neighbours = [Edge]()
    
    var hashValue: Int { return key.hashValue }
    var description: String { return key }
    
    init(_ key: String) {
        self.key = key
    }
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.hashValue == rhs.hashValue
}


/// A basic edge data structure
class Edge: Printable {
    let from: Vertex
    let to: Vertex
    var weight: Int
    
    var description: String { return "From: \(from) To: \(to) Weight: \(weight)"}
    
    init(from: Vertex, to: Vertex, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}


/// A directed graph canvas
class Graph {
    private(set) var vertices = [Vertex]()
    private(set) var edges = [Edge]()
    
    /// Adds a vertex to the canvas
    func addVertex(vertex: Vertex) {
        vertices.append(vertex)
    }
    
    /// Adds all given vertices to the canvas
    func addVertices(vertices: Vertex...) {
        vertices.map(addVertex)
    }
    
    /// Removes a vertex from the graph, along with all associated edges
    func removeVertex(vertex: Vertex) {
        if let index = find(vertices, vertex) {
            vertices.removeAtIndex(index)
        }
        
        for i in reverse(0..<edges.count) {
            let edge = edges[i]
            if edge.from == vertex || edge.to == vertex {
                edges.removeAtIndex(i)
            }
        }
    }
    
    /// Creates an edge, and updates the canvas with it along with the source vertex's adjaceny list
    func addEdgeFrom(source: Vertex, to destination: Vertex, weight: Int) {
        var edge = Edge(from: source, to: destination, weight: weight)
        edges.append(edge)
        source.neighbours.append(edge)
    }
}