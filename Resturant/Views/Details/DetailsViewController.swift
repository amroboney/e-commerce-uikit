//
//  DetailsViewController.swift
//  Resturant
//
//  Created by amro adil on 10/12/2023.
//

import UIKit
//import ProgressHUD

class DetailsViewController: UIViewController {

    @IBOutlet weak var deshImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    var productId: String = ""
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NetworkManeger.shared.fetchFindProduct(productId: productId,  completion: { [weak self] (result) in
            switch result {
                
            case .success(let product):
                self?.product = product
                self?.popularView()
                
            case .failure(let error):
                print("error in fetsh home controller")
                print(error.localizedDescription)
            }
        })
            
            
        
    }
    
    func popularView() {
        deshImageView.kf.setImage(with: product.image?.asURL)
        nameLbl.text = product.name
        priceLbl.text = product.formatPrice
        sizeLbl.text = product.formatSize
        descriptionLbl.text = product.description
    }
//    
//    @IBAction func varifyOrderPresse(_ sender: UIButton) {
//    }
    
}
