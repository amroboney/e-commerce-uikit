//
//  LoaderButton.swift
//  Resturant
//
//  Created by amro adil on 26/12/2023.
//

import UIKit

class LoaderButton: UIButton {

    var spinner = UIActivityIndicatorView()
    
    var isLoading = false {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    

    func setupView() {
        spinner.hidesWhenStopped = true
        spinner.color = .white
        spinner.style = .medium
        
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func updateView() {
        if isLoading {
            spinner.startAnimating()
            titleLabel?.alpha = 0
            imageView?.alpha = 0
            isEnabled = false
        }else {
            spinner.stopAnimating()
            titleLabel?.alpha = 1
            imageView?.alpha = 0
            isEnabled = true
            
        }
    }
}
