//
//  BookViewStub.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 17/12/2020.
//

@testable import WBooks
import Foundation
import UIKit

final class BookViewStub: UIView, BookView {
    
    private(set) var setTitleCalled = false
    private(set) var setAuthorCalled = false
    private(set) var setCoverCalled = false
    
    func setTitle(_ text: String) {
        setTitleCalled = true
    }
    
    func setAuthor(_ text: String) {
        setAuthorCalled = true
    }
    
    func setCover(_ image: UIImage?) {
        setCoverCalled = true
    }
}
