//
//  ShortestPath.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

typealias ShortestPathDict = [Vertex: (parent: Vertex?, weight: Int)]

private func initRelax(vertices: [Vertex], s: Vertex) -> ShortestPathDict {
    var d = ShortestPathDict()
    
    for vertex in vertices {
        d[vertex] = (nil, 500)
    }
    d[s]!.weight = 0
    
    return d
}

func Bellman_Ford(graph: Graph, s: Vertex) -> ShortestPathDict {
    // Initialisation
    var d = initRelax(graph.canvas, s)
    
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

func FIFO_Bellman_Ford(graph: Graph, s: Vertex) -> ShortestPathDict {
    // Initialisation
    var d = initRelax(graph.canvas, s)
    
    let queue = FIFOQueue<Vertex>()
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

func Dijkstra(graph: Graph, s: Vertex) -> ShortestPathDict {
    // Initialisation
    var d = initRelax(graph.canvas, s)
    
    let queue = PriorityQueue<Int, Vertex>()
    for (vertex, (_, weight)) in d {
        queue.enqueue(weight, value: vertex)
    }
    
    func relax(edge: Edge) {
        let currWeight = d[edge.from]!.weight + edge.weight
        if d[edge.to]!.weight > currWeight {
            d[edge.to] = (edge.from, currWeight)
            queue.decreaseKey(edge.to, to: currWeight)
        }
    }
    
    while let u = queue.dequeue() {
        u.neighbours.map(relax)
    }
    
    return d
}

func topologicalSort(start: Vertex, var sortedVertices: [Vertex] = []) -> [Vertex] {
    // TODO: 'contains' is O(n), can make O(1)
    if !contains(sortedVertices, start){
        for edge in start.neighbours {
            sortedVertices = topologicalSort(edge.to, sortedVertices: sortedVertices)
        }
        sortedVertices.append(start)
    }
    return sortedVertices
}

func SingleSourceShortestPath(graph: Graph, s: Vertex) -> ShortestPathDict {
    // Initialisation
    var d = initRelax(graph.canvas, s)
    let sortedVertices = topologicalSort(s).reverse()
    
    func relax(edge: Edge) {
        let currWeight = d[edge.from]!.weight + edge.weight
        if d[edge.to]!.weight > currWeight {
            d[edge.to] = (edge.from, currWeight)
        }
    }
    
    for vertex in sortedVertices {
        vertex.neighbours.map(relax)
    }
    
    return d
}

func Johnson(graph: Graph) -> Matrix<Vertex, Int> {
    let s = Vertex("S")
    graph.addVertex(s)
    for vertex in graph.canvas {
        graph.addEdgeFrom(s, to: vertex, weight: 0)
    }
    
    let d = FIFO_Bellman_Ford(graph, s)
    graph.removeVertex(s)
    
    for edge in graph.edges {
        edge.weight += d[edge.from]!.weight - d[edge.to]!.weight
    }
    
    let D = Matrix<Vertex, Int>()
    for u in graph.canvas {
        let pD = Dijkstra(graph, u)
        for v in graph.edges {
            D[u, v.to] = pD[v.to]!.weight - (d[u]!.weight - d[v.to]!.weight)
        }
    }
    
    return D
}
