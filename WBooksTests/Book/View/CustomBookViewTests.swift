//
//  CustomBookViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 18/12/2020.
//

@testable import WBooks
import Foundation
import XCTest
import FBSnapshotTestCase

/// Book view that uses a nib file.
final class CustomBookViewTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        // 'True' to record, 'false' to verify.
        self.recordMode = false
    }
    
    private func newView() -> CustomBookView {
        let view = CustomBookView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        return view
    }
    
    func testEmptyView() {
        let view = newView()
        FBSnapshotVerifyView(view)
    }
    
    func testViewWithBook() {
        let view = newView()
        view.setBook(Book(name: "The Hobbit", author: "J.R.R Tolkien", cover: "path"))

        FBSnapshotVerifyView(view)
    }
}
