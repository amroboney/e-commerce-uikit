//
//  PopularCollectionViewCell.swift
//  Resturant
//
//  Created by amro adil on 10/12/2023.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    static let identifire = String(describing: PopularCollectionViewCell.self)
    
    @IBOutlet weak var namgeLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    
    func setup(_ dash: Product) {
        namgeLbl.text = dash.name
        imageView.kf.setImage(with: dash.image?.asURL)
        sizeLbl.text = dash.formatSize
        priceLbl.text = dash.formatPrice
    }
}
