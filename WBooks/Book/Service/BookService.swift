//
//  BookService.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import UIKit
import Foundation

/// Delegate for book request events.
public protocol BookServiceDelegate: class {
    
    /// Called when an image request finishes loading.
    func didLoadImage(_ image: UIImage?)
}

/// Protocol for requesting book covers.
public protocol BookService {
    
    var delegate: BookServiceDelegate? { get set }
    
    /// Obtains a book cover from a path.
    ///
    /// - Parameter path: the path to get the cover from.
    func loadCover(path: String)
}
