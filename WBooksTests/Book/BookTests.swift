//
//  BookTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

@testable import WBooks
import Foundation
import XCTest

final class BookTests: XCTestCase {
    
    func testName() {
        let name = "The Hobbit"
        let author = "J.R.R Tolkien"
        let book = Book(name: name, author: author, cover: "path")
        XCTAssertEqual(book.name, name, "The names should match")
    }
    
    func testWrongName() {
        let name = "The Hobbit"
        let author = "J.R.R Tolkien"
        let book = Book(name: name, author: author, cover: "path")
        XCTAssertNotEqual(book.name, "J.K Rowling", "The names should not match")
    }
}
