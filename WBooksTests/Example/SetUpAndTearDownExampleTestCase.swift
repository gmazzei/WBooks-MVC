//
//  SetUpAndTearDownExampleTestCase.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 23/12/2020.
//

import Foundation
import XCTest

final class SetUpAndTearDownExampleTestCase: XCTestCase {
    
    override class func setUp() { // 1.
        // This is the setUp() class method.
        // It is called before the first test method begins.
        // Set up any overall initial state here.
        
        print("1 - class setup")
    }
    
    override func setUpWithError() throws { // 2.
        // This is the setUpWithError() instance method.
        // It is called before each test method begins.
        // Set up any per-test state here.
        
        print("2 - setUpWithError")
    }
    
    override func setUp() { // 3.
        // This is the setUp() instance method.
        // It is called before each test method begins.
        // Use setUpWithError() to set up any per-test state,
        // unless you have legacy tests using setUp().
        
        print("3 - setup")
    }
    
    func testMethod1() throws { // 4.
        // This is the first test method.
        // Your testing code goes here.
        print("4 - testMethod1")
        
        addTeardownBlock { // 5.
            // Called when testMethod1() ends.
            print("5 - addTeardownBlock")
        }
    }
    
    func testMethod2() throws { // 6.
        // This is the second test method.
        // Your testing code goes here.
        print("6 - testMethod2")
        
        addTeardownBlock { // 7.
            // Called when testMethod2() ends.
            print("7 - addTeardownBlock")
        }
        addTeardownBlock { // 8.
            // Called when testMethod2() ends.
            print("8 - addTeardownBlock")
        }
    }
    
    override func tearDown() { // 9.
        // This is the tearDown() instance method.
        // It is called after each test method completes.
        // Use tearDownWithError() for any per-test cleanup,
        // unless you have legacy tests using tearDown().
        
        print("9 - tearDown")
    }
    
    override func tearDownWithError() throws { // 10.
        // This is the tearDownWithError() instance method.
        // It is called after each test method completes.
        // Perform any per-test cleanup here.
        print("10 - tearDownWithError")
    }
    
    override class func tearDown() { // 11.
        // This is the tearDown() class method.
        // It is called after all test methods complete.
        // Perform any overall cleanup here.
        print("11 - class tearDown")
    }
    
}
