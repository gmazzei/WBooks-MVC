//
//  BookControllerTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

@testable import WBooks
import Foundation
import XCTest

private struct Constants {
    static let timeout: TimeInterval = 5.0
}

final class BookAPIServiceTests: XCTestCase, BookServiceDelegate {
    
    private var expectation: XCTestExpectation?
    
    func testLoadCoverRequest() {
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Download book cover")
        
        let book = Book(name: "The Hobbit", author: "J.R.R Tolkien",
                        cover: "https://i.harperapps.com/hcanz/covers/9780008108281/x293.jpg")
        
        self.expectation = expectation
        
        let service = BookAPIService()
        service.delegate = self
        service.loadCover(path: book.cover)
        
        // Wait until the expectation is fulfilled, with a timeout of 5 seconds.
        wait(for: [expectation], timeout: Constants.timeout)
    }
    
    // MARK: - BookServiceDelegate
    
    func didLoadImage(_ image: UIImage?) {
        guard let expectation = expectation else {
            XCTFail("The expectation was not initialized properly")
            return
        }
        
        expectation.fulfill()
    }
}
