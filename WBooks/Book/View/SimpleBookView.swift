//
//  BookView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import Foundation
import UIKit

/// Constants for the book view.
private struct Constants {
    // General
    static let backgroundColor: UIColor = .white
    static let verticalMargin: CGFloat = 40
    static let horizontalMargin: CGFloat = 40
    static let elementInterspace: CGFloat = 20
    
    // Title
    static let titleLabelHeight: CGFloat = 24
    static let titleLabelFont: UIFont = .boldSystemFont(ofSize: 24)
    
    // Author
    static let authorLabelHeight: CGFloat = 20
    static let authorLabelFont: UIFont = .boldSystemFont(ofSize: 20)
    
    // Cover
    static let imageViewCornerRadius: CGFloat = 10
    static let imageViewBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.1)
}

/// View for the book controller.
final class SimpleBookView: UIView, BookView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.titleLabelFont
        label.textAlignment = .center
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.authorLabelFont
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = Constants.imageViewCornerRadius
        view.layer.masksToBounds = true
        view.backgroundColor = Constants.imageViewBackgroundColor
        return view
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    /// Sets up the view hierarchy and constraints.
    private func setupView() {
        backgroundColor = Constants.backgroundColor
        
        [titleLabel, authorLabel, imageView].forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.verticalMargin),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalMargin),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.horizontalMargin),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: Constants.elementInterspace),
            authorLabel.heightAnchor.constraint(equalToConstant: Constants.authorLabelHeight),
            authorLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalMargin),
            authorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.horizontalMargin),
            
            imageView.topAnchor.constraint(equalTo: authorLabel.safeAreaLayoutGuide.bottomAnchor, constant: Constants.elementInterspace),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Constants.verticalMargin),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalMargin),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.horizontalMargin),
        ])
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
