//
//  CategoryViewController.swift
//  Resturant
//
//  Created by amro adil on 12/12/2023.
//

import UIKit

class CategoryViewController: UIViewController {

    var categories: [Category] = []
    
    @IBOutlet weak var collectionViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Catogery"
        registerCell()
    }
    
    private func registerCell() {
        collectionViewController.register(UINib(nibName: MainCategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MainCategoryCollectionViewCell.identifier)
    }
}

// MARK: - Category view extension
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCollectionViewCell.identifier, for: indexPath) as! MainCategoryCollectionViewCell
        
        cell.setup(category: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ListProductViewController.instantiate()
        controller.category = categories[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
