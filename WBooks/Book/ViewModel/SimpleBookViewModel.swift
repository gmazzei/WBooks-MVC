//
//  SimpleBookViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 21/12/2020.
//

import Foundation
import UIKit

final class SimpleBookViewModel: BookViewModel, BookServiceDelegate {
    
    weak var delegate: BookViewModelDelegate?
    private let book: Book
    private var service: BookService
    
    var titleText: String {
        book.name
    }
    
    var authorText: String {
        book.author
    }
    
    // MARK: - Initializers
    
    init(model: Book,
         service: BookService = BookAPIService()) {
        self.book = model
        self.service = service
        self.service.delegate = self
    }
    
    // MARK: - BookViewModel
    
    func loadCover() {
        service.loadCover(path: book.cover)
    }
    
    func configure(view: BookView) {
        view.setTitle(titleText)
        view.setAuthor(authorText)
    }
    
    func configure(image: UIImage?, for view: BookView) {
        view.setCover(image)
    }
    
    // MARK: - BookServiceDelegate
    
    func didLoadImage(_ image: UIImage?) {
        delegate?.didLoadImage(image)
    }
}
