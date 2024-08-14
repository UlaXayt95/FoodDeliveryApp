//
//  File.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 14.08.2024.
//

import UIKit

class OnbordingCoordinator: Cordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCordinator finish")
    }
}
