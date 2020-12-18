//
//  CustomBookView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 18/12/2020.
//

import Foundation
import UIKit

private struct Constants {
    static let imageViewCornerRadius: CGFloat = 10
}

final class CustomBookView: NibView, BookView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = Constants.imageViewCornerRadius
        }
    }
        
    // MARK: - BookView
    
    func setBook(_ book: Book) {
        titleLabel.text = book.name
        authorLabel.text = book.author
    }
    
    func setBookCover(_ image: UIImage?) {
        imageView.image = image
    }
}
