//
//  ShortestPath.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

typealias pw = (parent: Vertex?, weight: Int)
func Bellman_Ford(graph: Graph, s: Vertex) -> [Vertex : pw] {
    // Initilisation
    var d = [Vertex : pw]()
    
    for vertex in graph.canvas {
        d[vertex] = (nil, 500)
    }
    d[s]!.weight = 0
    
    func relax(edge: Edge) {
        let currWeight = d[edge.from]!.weight + edge.weight
        if d[edge.to]!.weight > currWeight {
            d[edge.to] = (edge.from, currWeight)
        }
    }

    // Main loop
    for vertex in graph.canvas {
        graph.edges.map(relax)
    }
    
    return d
}
