//
//  DishLandignScapeCollectionViewCell.swift
//  Resturant
//
//  Created by amro adil on 10/12/2023.
//

import UIKit

class ProductLandignScapeCollectionViewCell: UICollectionViewCell {

    static let identifire = String(describing: ProductLandignScapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    
    func setup(_ dash: Product) {
        dishImageView.kf.setImage(with: dash.image?.asURL)
        nameLbl.text = dash.name
        sizeLbl.text = dash.formatSize
        priceLbl.text = dash.formatPrice
    }
}
