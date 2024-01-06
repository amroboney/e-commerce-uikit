//
//  HomeViewController.swift
//  Resturant
//
//  Created by amro adil on 09/12/2023.
//

import UIKit
//import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var PopularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    
    var categories: [Category] = []
    
    var populars: [Product] = []

    var spacials: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        NetworkManeger.shared.fetchAllCategories { [weak self] (result) in
            switch result {
                
            case .success(let categories):
                self?.categories = categories 
                self?.categoryCollectionView.reloadData()
            case .failure(let error):
                print("error in fetsh home controller")
                print(error.localizedDescription)
        }
            
        NetworkManeger.shared.fetchPopulars { [weak self] (result) in
            switch result {
            case .success(let populars):
                self?.populars = populars
                self?.spacials = populars

                
                self?.PopularCollectionView.reloadData()
                self?.specialCollectionView.reloadData()
            case .failure(let error):
                print("error in fetsh home controller")
                print(error.localizedDescription)
            }
        }
            
            
        }
    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifire)
        
        PopularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifire, bundle: nil),
                                       forCellWithReuseIdentifier: PopularCollectionViewCell.identifire)
        
        specialCollectionView.register(UINib(nibName: ProductLandignScapeCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: ProductLandignScapeCollectionViewCell.identifire)
    }
    
    @IBAction func showAllCategoryPressed(_ sender: UIButton) {
        
        let controller = CategoryViewController.instantiate()
        
        controller.categories = categories
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

// MARK: - colletion view extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case PopularCollectionView:
            return populars.count
        case specialCollectionView:
            return spacials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifire, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(categories[indexPath.row])
            return cell
            
        case PopularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifire, for: indexPath) as! PopularCollectionViewCell
            cell.setup(populars[indexPath.row])
            return cell
            
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductLandignScapeCollectionViewCell.identifire, for: indexPath) as! ProductLandignScapeCollectionViewCell
            cell.setup(populars[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListProductViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
             
            
        }else {
            let controller = DetailsViewController.instantiate()
            controller.productId = (collectionView == PopularCollectionView ? populars[indexPath.row].id : spacials[indexPath.row].id)!
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

