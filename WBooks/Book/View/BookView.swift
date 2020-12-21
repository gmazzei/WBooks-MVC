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
    
    /// Changes the text in the title label.
    ///
    /// - Parameter text: the new text.
    func setTitle(_ text: String)
    
    /// Changes the text in the author label.
    ///
    /// - Parameter text: the new text.
    func setAuthor(_ text: String)
    
    /// Changes the image in the image view.
    ///
    /// - Parameter image: the new image.
    func setCover(_ image: UIImage?)
}
