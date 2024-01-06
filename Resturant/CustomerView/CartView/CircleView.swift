//
//  CircleView.swift
//  Resturant
//
//  Created by amro adil on 12/12/2023.
//

import UIKit


class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    
    private func initalSetup() {
        layer.cornerRadius = layer.bounds.height / 2
        clipsToBounds = true
//        cornerRadius = layer.bounds.width / 2
    }
}

