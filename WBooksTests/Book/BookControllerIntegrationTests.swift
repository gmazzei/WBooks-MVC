//
//  BookControllerIntegrationTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 17/12/2020.
//

@testable import WBooks
import Foundation
import XCTest
import FBSnapshotTestCase

/// Tests for the book controller, view model and view.
final class BookControllerIntegrationTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    private func newController() -> BookController {
        let book = Book(name: "The Hobbit", author: "J.R.R Tolkien", cover: "path")
        let service = BookServiceStub()
        let bookViewModel = SimpleBookViewModel(model: book, service: service)
        let bookView = SimpleBookView()
        let controller = BookController(viewModel: bookViewModel, view: bookView)
        controller.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        return controller
    }
    
    func testControllerView() {
        let controller = newController()
        FBSnapshotVerifyView(controller.view)
    }
}
