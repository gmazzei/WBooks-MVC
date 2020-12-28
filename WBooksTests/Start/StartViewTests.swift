//
//  StartViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 28/12/2020.
//

@testable import WBooks
import Foundation
import XCTest
import FBSnapshotTestCase

final class StartViewTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        recordMode = false
    }
    
    private func newView() -> StartView {
        let view = StartView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        return view
    }
    
    func testView() {
        let view = newView()
        FBSnapshotVerifyView(view)
    }
    
    func testButtonBeforeTapping() {
        let delegate = StartViewDelegateStub()
        let view = newView()
        view.delegate = delegate
        XCTAssertFalse(delegate.didTapButtonCalled, "didTap() should not have been called")
    }
    
    func testButtonAfterTapping() {
        let delegate = StartViewDelegateStub()
        let view = newView()
        view.delegate = delegate
        view.buttonTapped()
        XCTAssertTrue(delegate.didTapButtonCalled, "didTap() should have been called")
    }
}

private class StartViewDelegateStub: StartViewDelegate {
    
    private(set) var didTapButtonCalled = false
    
    func didTapButton() {
        didTapButtonCalled = true
    }
}
