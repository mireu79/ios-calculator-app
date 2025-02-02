//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lee minyeol on 2023/10/04.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var list: [T] = []
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return list.removeFirst()
        }
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
