//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 17.08.2024.
//

import UIKit


class HomeCordinator: Cordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCordinator finish")
    }
}
