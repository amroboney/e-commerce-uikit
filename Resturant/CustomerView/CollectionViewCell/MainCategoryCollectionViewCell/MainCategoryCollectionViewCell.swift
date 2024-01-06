//
//  MainCategoryCollectionViewCell.swift
//  Resturant
//
//  Created by amro adil on 12/12/2023.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: MainCategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    func setup(category: Category) {
        categoryImageView.kf.setImage(with: category.image?.asURL)
        nameLbl.text = category.name
    }

}
