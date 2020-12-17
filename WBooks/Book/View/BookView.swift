//
//  BookView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 17/12/2020.
//

import Foundation
import UIKit

protocol BookView: UIView {
    
    init()
    
    /// Updates the view for a specific book.
    ///
    /// - Parameter book: the new book.
    func setBook(_ book: Book)
    
    /// Sets the image for the book.
    ///
    /// - Parameter image: the new image.
    func setBookCover(_ image: UIImage?)
}
