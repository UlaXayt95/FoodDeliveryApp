//
//  ListCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 17.08.2024.
//

import UIKit

class ListCoordinator: Cordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCordinator finish")
    }
}
