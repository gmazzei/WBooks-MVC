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
    
    private(set) var setBookCalled = false
    private(set) var setBookCoverCalled = false
    
    func setBook(_ book: Book) {
        setBookCalled = true
    }
    
    func setBookCover(_ image: UIImage?) {
        setBookCoverCalled = true
    }
}
