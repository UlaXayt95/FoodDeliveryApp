//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 17.08.2024.
//

import UIKit

class ProfileCoordinator: Cordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .cyan
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCordinator finish")
    }
}
