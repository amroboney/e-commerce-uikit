//
//  ListOdersViewController.swift
//  Resturant
//
//  Created by amro adil on 11/12/2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

 
    
    @IBOutlet var listColicationView: UIView!
    let orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        registerCells()
    }
    
//    func registerCells () {
//        listColicationView.register(UINib(nibName: DishListCollectionViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListCollectionViewCell.identifier)
//    }
}

//extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return orders.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCollectionViewCell.identifier, for: indexPath) as! DishListCollectionViewCell
//        
//        cell.setup(order: orders[indexPath.row])
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let controller = DetailsViewController.instantiate()
//        controller.dish = orders[indexPath.row].dish
//        navigationController?.pushViewController(controller, animated: true)
//    }
//    
//}
