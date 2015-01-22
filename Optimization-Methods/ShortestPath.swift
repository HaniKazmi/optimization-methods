//
//  ShortestPath.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

typealias pw = (parent: Vertex?, weight: Int)

private func initRelax(vertices: [Vertex]) -> [Vertex : pw] {
    var d = [Vertex : pw]()
    
    for vertex in vertices {
        d[vertex] = (nil, 500)
    }
    
    return d
}

func Bellman_Ford(graph: Graph, s: Vertex) -> [Vertex : pw] {
    // Initilisation
    var d = initRelax(graph.canvas)
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

func FIFO_Bellman_Ford(graph: Graph, s: Vertex) -> [Vertex : pw] {
    // Initilisation
    var d = initRelax(graph.canvas)
    d[s]!.weight = 0

    let queue = Queue<Vertex>()
    queue.enqueue(s)
    
    func relax(edge: Edge) {
        let currWeight = d[edge.from]!.weight + edge.weight
        if d[edge.to]!.weight > currWeight {
            d[edge.to] = (edge.from, currWeight)
            if !queue.contains(edge.to) { queue.enqueue(edge.to) }
        }
    }
    
    // Main loop
    while let u = queue.dequeue() {
        u.neighbours.map(relax)
    }
    
    return d
}

func Dijkstra(graph: Graph, s: Vertex) {
    // Initilisation
    var d = initRelax(graph.canvas)
    d[s]!.weight = 0
    
    let minNodes = [Vertex]()
    let queue = PriorityQueue<Int, Vertex>()
    
    func relax(edge: Edge) {
        let currWeight = d[edge.from]!.weight + edge.weight
        if d[edge.to]!.weight > currWeight {
            d[edge.to] = (edge.from, currWeight)
        }
    }
    
    for (vertex, (_, weight)) in d {
        queue.push(weight, value: vertex)
    }
    
    while let u = queue.pop() {
        u.neighbours.map(relax)
    }
}