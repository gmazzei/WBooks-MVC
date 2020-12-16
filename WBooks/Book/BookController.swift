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
    
    private lazy var bookView = BookView()
    
    // MARK: - Initializers
    
    init(book: Book, bookService: BookService) {
        self.book = book
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
        print("L - CALLING")
        bookService.loadCover(path: book.cover)
    }

    // MARK: - BookServiceDelegate
    
    func didLoadImage(_ image: UIImage?) {
        bookView.setBookCover(image)
    }
}

