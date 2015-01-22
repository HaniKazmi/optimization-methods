//
//  PriorityQueue.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 22/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

class PriorityQueue<PrioType: Comparable, ValueType: Hashable>: GeneratorType {
    typealias heapType = (prio: PrioType, value: ValueType)
    final private var heap = [heapType]()
    private var valueIndice = [ValueType: Int]()
    
    func push(priority: PrioType, value: ValueType) {
        heap.append((priority, value))

        var current = heap.count - 1
        
        while current > 0 {
            var parent = (current - 1) >> 1
            if heap[parent].prio <= heap[current].prio {
                break
            }
            swap(&heap[parent], &heap[current])
            current = parent
        }
    }
    
    func pop() -> ValueType? {
        if heap.count == 0 { return nil }
        
        swap(&heap[0], &heap[heap.endIndex - 1])
        let pop = heap.removeLast()
        heapify(0)
        return pop.value
    }
    
    func next() -> ValueType? {
        return pop()
    }
    
    var count: Int { return heap.count }
    
    func heapify(index: Int) {
        let left = index * 2 + 1
        let right = index * 2 + 2
        var smallest = index
        
        if left < count && heap[left].prio < heap[smallest].prio {
            smallest = left
        }
        if right < count && heap[right].prio < heap[smallest].prio {
            smallest = right
        }
        if smallest != index {
            swap(&heap[index], &heap[smallest])
            heapify(smallest)
        }
    }
}

extension PriorityQueue: SequenceType {
    typealias Generator = PriorityQueue
    func generate() -> Generator {
        return self
    }
}
