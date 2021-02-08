//
//  NumberGenerator.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 08/02/2021.
//

import Foundation

struct NumberGenerator {
    
    func calculatePrimeNumber(upTo max: Int) -> [Int] {
        var list: [Int] = []
        
        for number in 2...max {
            if number.isPrime {
                list.append(number)
            }
        }
        
        return list
    }
    
}

private extension Int {
    
    var isPrime: Bool {
        let minimum = 2
        let half: Int = self / 2
        let limit = Swift.max(minimum, half)
        // let limit: Int = half >= minimum ? half : minimum
        
        for number in minimum..<limit {
            if isMultiple(of: number) {
                return false
            }
        }
        
        return true
    }
    
}
