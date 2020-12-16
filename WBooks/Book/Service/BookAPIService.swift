//
//  BookAPIService.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 15/12/2020.
//

import Foundation
import UIKit

final class BookAPIService: BookService {
    
    weak var delegate: BookServiceDelegate?
    
    func loadCover(path: String) {
        guard let url = URL(string: path), let delegate = delegate else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                delegate.didLoadImage(image)
            }
        }
    }
}
