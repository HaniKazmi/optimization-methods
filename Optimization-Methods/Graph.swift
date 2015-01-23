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


class Edge: Printable {
    let from: Vertex
    let to: Vertex
    var weight: Int
    
    var description: String { return "\(from) \(to) \(weight)"}
    
    init(from: Vertex, to: Vertex, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
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
    
    func removeVertex(vertex: Vertex) {
        if let index = find(canvas, vertex) {
            canvas.removeAtIndex(index)
        }
        
        for i in reverse(0..<edges.count) {
            let edge = edges[i]
            if edge.from == vertex || edge.to == vertex {
                edges.removeAtIndex(i)
            }
        }
    }
    
    func addEdgeFrom(source: Vertex, to destination: Vertex, weight: Int) {
        var edge = Edge(from: source, to: destination, weight: weight)
        edges.append(edge)
        source.neighbours.append(edge)
    }
}