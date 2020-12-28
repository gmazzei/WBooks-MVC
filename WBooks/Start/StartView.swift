//
//  StartView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 28/12/2020.
//

import Foundation
import UIKit

/// Protocol for handling tap events.
protocol StartViewDelegate: class {
    
    /// Called when the main button is tapped.
    func didTapButton()
}

/// Constants for the start view.
private struct Constants {
    static let buttonCornerRadius: CGFloat = 10
    static let buttonWidth: CGFloat = 100
    static let buttonHeight: CGFloat = 40
    static let buttonBackgroundColor: UIColor = .blue
    static let buttonFontColor: UIColor = .white
}

/// Sample view for TDD.
final class StartView: UIView {
    
    weak var delegate: StartViewDelegate?
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setTitleColor(Constants.buttonFontColor, for: .normal)
        button.backgroundColor = Constants.buttonBackgroundColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupRecognizers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    /// Sets up the view hierarchy and constraints.
    private func setupViews() {
        addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            mainButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            mainButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    /// Adds the necessary recognizers to the views.
    private func setupRecognizers() {
        mainButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Gesture recognizers
    
    @objc func buttonTapped() {
        delegate?.didTapButton()
    }
}
