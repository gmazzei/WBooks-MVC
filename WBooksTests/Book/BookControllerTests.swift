//
//  BookControllerTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 17/12/2020.
//

@testable import WBooks
import Foundation
import XCTest

final class BookControllerTests: XCTestCase {

    func testControllerLoad() {
        let book = Book(name: "The Hobbit", author: "J.R.R Tolkien", cover: "path")
        let service = BookServiceStub()
        let bookView = BookViewStub()
        let controller = BookController(book: book, bookView: bookView, bookService: service)
        controller.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        
        XCTAssert(service.loadCoverCalled, "'loadCover(path:)' should have been called")
        XCTAssert(bookView.setBookCalled, "'setBook(_:)' should have been called")
        XCTAssert(bookView.setBookCoverCalled, "'setBookCover(_:)' should have been called")
    }
}
