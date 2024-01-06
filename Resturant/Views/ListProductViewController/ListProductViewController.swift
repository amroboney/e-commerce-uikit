//
//  ListProductViewController.swift
//  Resturant
//
//  Created by amro adil on 10/12/2023.
//

import UIKit

class ListProductViewController: UIViewController {

    var products: [Product] = []
    var category: Category?
    
    @IBOutlet weak var productListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        registerCell()
        
        NetworkManeger.shared.fetchPopulars { [weak self] (result) in
            switch result {
                
            case .success(let populars):
                self?.products = populars ?? []
               
                self?.productListCollectionView.reloadData()
                
            case .failure(let error):
                print("error in fetsh home controller")
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func registerCell() {
        productListCollectionView.register(UINib(nibName: ProductListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductListCollectionViewCell.identifier)
    }
    
}

extension ListProductViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.identifier, for: indexPath) as! ProductListCollectionViewCell
        
        cell.setup(products[indexPath.row])
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailsViewController.instantiate()
        controller.productId = products[indexPath.row].id
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
