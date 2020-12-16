//
//  BookView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import Foundation
import UIKit

private struct Constants {
    static let backgroundColor: UIColor = .white
    static let imageViewMargin: CGFloat = 40
}

/// View for the book controller.
final class BookView: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Constants.backgroundColor
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    /// Sets up the view hierarchy and constraints.
    private func setupView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.imageViewMargin),
            imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: -Constants.imageViewMargin),
        ])
    }
    
    // MARK: - Public interface
    
    /// Sets the image for the book.
    ///
    /// - Parameter image: the new image.
    func setBookCover(_ image: UIImage?) {
        imageView.image = image
    }
}
