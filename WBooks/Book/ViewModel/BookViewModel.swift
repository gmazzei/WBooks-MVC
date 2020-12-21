//
//  BookViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 21/12/2020.
//

import Foundation
import UIKit

/// Delegate for book request events.
protocol BookViewModelDelegate: class {
    
    /// Called when an image request finishes loading.
    func didLoadImage(_ image: UIImage?)
}

/// The view model for the book view.
protocol BookViewModel {
    
    var delegate: BookViewModelDelegate? { get set }

    init(model: Book, service: BookService)
    
    /// Starts the request to get the book cover.
    func loadCover()
    
    /// Configures a book view according to the model properties.
    ///
    /// - Parameter view: the view for configuring.
    func configure(view: BookView)
    
    /// Configures the image in the book view according to the model image path.
    ///
    /// - Parameters
    ///   - image: the new image.
    ///   - view: the view for configuring.
    func configure(image: UIImage?, for view: BookView)
}
