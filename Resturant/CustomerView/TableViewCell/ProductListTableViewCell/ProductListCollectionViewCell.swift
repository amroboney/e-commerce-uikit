//
//  DishListTableViewCell.swift
//  Resturant
//
//  Created by amro adil on 10/12/2023.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: ProductListCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    
    func setup(_ product: Product) {
        dishImageView.kf.setImage(with: product.image?.asURL)
        nameLbl.text = product.name
        priceLbl.text = product.formatPrice
        sizeLbl.text = product.formatSize
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        nameLbl.text = order.dish?.name
        priceLbl.text = order.dish?.formatPrice
        sizeLbl.text = order.dish?.formatSize
        
    }
}
