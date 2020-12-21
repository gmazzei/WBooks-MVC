//
//  BookViewModelStub.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 21/12/2020.
//

@testable import WBooks
import Foundation
import XCTest

final class BookViewModelStub: BookViewModel {
   
    weak var delegate: BookViewModelDelegate?
    
    private(set) var loadCoverCalled = false
    private(set) var configureCalled = false
    private(set) var configureCoverCalled = false
    private(set) var didLoadImageCalled = false
    
    init(model: Book, service: BookService) {
 
    }
    
    // MARK: - BookViewModel
    
    func loadCover() {
        loadCoverCalled = true
    }
    
    func configure(view: BookView) {
        configureCalled = true
    }
    
    func configure(image: UIImage?, for: BookView) {
        configureCoverCalled = true
    }
    
    // MARK: - BookServiceDelegate
    
    func didLoadImage(_ image: UIImage?) {
        didLoadImageCalled = true
    }
}
