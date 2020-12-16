//
//  BookServiceStub.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import WBooks
import Foundation
import UIKit

final class BookServiceStub: BookService {
    
    weak var delegate: BookServiceDelegate?
    
    func loadCover(path: String) {
        delegate?.didLoadImage(UIImage())
    }
}
