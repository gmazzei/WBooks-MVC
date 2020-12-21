//
//  SimpleBookViewModelTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 21/12/2020.
//

@testable import WBooks
import Foundation
import XCTest

final class SimpleBookViewModelTests: XCTestCase {
        
    func testViewModelConfigure() {
        let book = Book(name: "The Hobbit", author: "J.R.R Tolkien", cover: "path")
        let service = BookServiceStub()
        let viewModel = SimpleBookViewModel(model: book, service: service)
        let view = BookViewStub()
        viewModel.configure(view: view)
        
        XCTAssert(view.setTitleCalled, "setTitle(_:) should have been called")
        XCTAssert(view.setAuthorCalled, "setAuthor(_:) should have been called")
        XCTAssert(!view.setCoverCalled, "setCover(_:) should have been called")
    }
    
    func testViewModelConfigureCover() {
        let book = Book(name: "The Hobbit", author: "J.R.R Tolkien", cover: "path")
        let service = BookServiceStub()
        let viewModel = SimpleBookViewModel(model: book, service: service)
        let view = BookViewStub()
        viewModel.configure(image: UIImage(), for: view)
        
        XCTAssert(!view.setTitleCalled, "setTitle(_:) should have been called")
        XCTAssert(!view.setAuthorCalled, "setAuthor(_:) should have been called")
        XCTAssert(view.setCoverCalled, "setCover(_:) should have been called")
    }
}
