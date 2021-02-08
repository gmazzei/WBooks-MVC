//
//  ViewController.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import UIKit
import Foundation

final class BookController: UIViewController, BookViewModelDelegate {
    
    private var bookViewModel: BookViewModel
    private var bookView: BookView
    
    // MARK: - Initializers
    
    init(viewModel: BookViewModel, view: BookView) {
        self.bookViewModel = viewModel
        self.bookView = view
        super.init(nibName: .none, bundle: .none)
        self.bookViewModel.delegate = self
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
        bookViewModel.loadCover()
        bookViewModel.configure(view: bookView)
    }
    
    // MARK: - BookViewModelDelegate
    
    func didLoadImage(_ image: UIImage?) {
        bookViewModel.configure(image: image, for: bookView)
    }
}
