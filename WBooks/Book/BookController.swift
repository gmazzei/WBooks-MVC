//
//  ViewController.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import UIKit
import Foundation

final class BookController: UIViewController, BookServiceDelegate {
    
    private let book: Book
    private var bookService: BookService
    private var bookView: BookView
    
    // MARK: - Initializers
    
    init(book: Book,
         bookView: BookView = SimpleBookView(),
         bookService: BookService = BookAPIService()) {
        self.book = book
        self.bookView = bookView
        self.bookService = bookService
        super.init(nibName: .none, bundle: .none)
        self.bookService.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        view = bookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookService.loadCover(path: book.cover)
        bookView.setBook(book)
    }

    // MARK: - BookServiceDelegate
    
    func didLoadImage(_ image: UIImage?) {
        bookView.setBookCover(image)
    }
}
