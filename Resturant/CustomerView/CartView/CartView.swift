//
//  CartView.swift
//  Resturant
//
//  Created by amro adil on 09/12/2023.
//

import UIKit

class CartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    
    private func initalSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        cornerRadius = 10
    }
}
