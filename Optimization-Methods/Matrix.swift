//
//  Matrix.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 23/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

class Matrix<KeyType: Hashable, ValueType> {
    var storage = [KeyType : [KeyType : ValueType]]()
    
    subscript(x: KeyType, y: KeyType) -> ValueType? {
        get {
            return storage[x]?[y]
        }
        set {
            if storage[x] == nil {
                storage[x] = [:]
            }
            storage[x]![y] = newValue
        }
    }
}
