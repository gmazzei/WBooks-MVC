//
//  NibView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 18/12/2020.
//

import UIKit

class NibView: UIView {
    
    var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
}

private extension NibView {
    
    func xibSetup() {
        backgroundColor = .clear
        let view = loadNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        
        self.view = view
    }
}
