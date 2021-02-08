//
//  PerformanceExampleTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 08/02/2021.
//

@testable import WBooks
import Foundation
import XCTest

final class PerformanceExampleTests: XCTestCase {
    
    func testNumberGenerator() {
        let generator = NumberGenerator()
        
        measure {
            let _ = generator.calculatePrimeNumber(upTo: 10000)
        }
        
    }
    
}
