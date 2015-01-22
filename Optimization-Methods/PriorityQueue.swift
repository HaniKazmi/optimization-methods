//
//  PriorityQueue.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 22/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

class PriorityQueue<PrioType: Comparable, ValueType: Hashable>: GeneratorType {
    typealias heapType = (prio: PrioType, value: ValueType)
    private final var heap = [heapType]()
    
    func push(priority: PrioType, value: ValueType) {
        heap.append((priority, value))
        percolateUp(heap.count - 1)
    }
    
    func pop() -> ValueType? {
        if heap.count == 0 { return nil }
        
        swap(&heap[0], &heap[heap.endIndex - 1])
        let pop = heap.removeLast()
        percolateDown(0)
        return pop.value
    }
    
    func next() -> ValueType? {
        return pop()
    }
    
    var count: Int { return heap.count }
    
    func percolateUp(current: Int) {
        if current == 0 { return }
        let parent = (current - 1) >> 1
        if heap[parent].prio > heap[current].prio {
            swap(&heap[parent], &heap[current])
            percolateUp(parent)
        }
    }
    
    func percolateDown(index: Int) {
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
            percolateDown(smallest)
        }
    }
    
    func decreaseKey(value: ValueType, to priority: PrioType) {
        let index = indexForValue(value)
        heap[index].prio = priority
        percolateUp(index)
    }
    
    // TODO: 'indexForValue' is O(n), can make O(1)
    func indexForValue(value: ValueType) -> Int {
        for (index, (_, element)) in enumerate(heap) {
            if element == value { return index }
        }
        return 0
    }
}

extension PriorityQueue: SequenceType {
    typealias Generator = PriorityQueue
    func generate() -> Generator {
        return self
    }
}
