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
        let bookViewModel = BookViewModelStub(model: book, service: service)
        let bookView = BookViewStub()
        let controller = BookController(viewModel: bookViewModel, view: bookView)
        controller.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        
        XCTAssert(bookViewModel.loadCoverCalled, "'loadCover(path:)' should have been called")
    }
}
