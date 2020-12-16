//
//  BookViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 16/12/2020.
//

@testable import WBooks
import Foundation
import XCTest
import FBSnapshotTestCase

final class BookViewTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        // 'True' to record, 'false' to verify.
        self.recordMode = false
    }
    
    func testEmptyView() {
        // Create a view.
        let view = BookView()
        
        // Always add a frame to the view.
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        
        // Verify the view.
        FBSnapshotVerifyView(view)
    }
    
    func testViewWithBook() {
        // Create a view.
        let view = BookView()
        
        // Always add a frame to the view.
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        
        // Fill the view with model.
        view.setBook(Book(name: "The Hobbit", author: "J.R.R Tolkien", cover: "path"))
        
        // Verify the view.
        FBSnapshotVerifyView(view)
    }
}
