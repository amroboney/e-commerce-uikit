//
//  CategoryCollectionViewCell.swift
//  Resturant
//
//  Created by amro adil on 09/12/2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifire = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var CaegoryImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    func setup(_ category: Category){
        nameLbl.text = category.name
        CaegoryImageView.kf.setImage(with: category.image?.asURL)
    }

}
