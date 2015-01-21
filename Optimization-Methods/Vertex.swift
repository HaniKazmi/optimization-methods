//
//  Vertex.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 21/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

struct Vertex: Hashable, Printable {
    let key: String
    var hashValue: Int { return key.hashValue }
    
    init(_ key: String) {
        self.key = key
    }
    
    var description: String { return key }
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.hashValue == rhs.hashValue
}