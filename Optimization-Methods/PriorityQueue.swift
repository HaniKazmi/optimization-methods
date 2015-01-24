//
//  PriorityQueue.swift
//  Optimization-Methods
//
//  Created by Hani Kazmi on 22/01/2015.
//  Copyright (c) 2015 Hani Kazmi. All rights reserved.
//

/// Key-Value data structure where the top element always has the lowest key. Implemented using a min-heap
class PriorityQueue<PrioType: Comparable, ValueType: Hashable>: GeneratorType {
    typealias heapType = (prio: PrioType, value: ValueType)
    private final var heap = [heapType]()
    
    var count: Int { return heap.count }
    
    /// Adds an element to the queue in O(log n)
    func enqueue(priority: PrioType, value: ValueType) {
        heap.append((priority, value))
        percolateUp(heap.count - 1)
    }
    
    /// Removes the minimum keyed value from the queue and returns the value. O(log n)
    func dequeue() -> ValueType? {
        if heap.count == 0 { return nil }
        
        swap(&heap[0], &heap[heap.endIndex - 1])
        let pop = heap.removeLast()
        percolateDown(0)
        return pop.value
    }
    
    /// Adjusts the key for the given value. O(n)
    func decreaseKey(value: ValueType, to priority: PrioType) {
        let index = indexForValue(value)
        heap[index].prio = priority
        percolateUp(index)
    }
    
    // TODO: 'indexForValue' is O(n), can make O(1)
    private func indexForValue(value: ValueType) -> Int {
        for (index, (_, element)) in enumerate(heap) {
            if element == value { return index }
        }
        return 0
    }
    
    func next() -> ValueType? {
        return dequeue()
    }
    
    func percolateUp(index: Int) {
        if index == 0 { return }
        
        let parent = (index - 1) >> 1
        if heap[parent].prio > heap[index].prio {
            swap(&heap[parent], &heap[index])
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
}

extension PriorityQueue: SequenceType {
    typealias Generator = PriorityQueue
    func generate() -> Generator {
        return self
    }
}