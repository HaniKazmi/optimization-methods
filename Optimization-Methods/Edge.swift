//
//  Edge.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

struct Edge: Printable {
    let from: Vertex
    let to: Vertex
    let weight: Int
    
    var description: String { return "\(from) \(to) \(weight)"}
}