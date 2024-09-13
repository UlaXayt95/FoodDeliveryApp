//
//  File.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 14.08.2024.
//

import UIKit
// MARK: - OnbordingCoordinator
class OnbordingCoordinator: Cordinator {
    
    
    // MARK: - Properties
    private let factory = SceneFactory.self
    
    
    //MARK: - Methods
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        showOnboarding()
    }
    override func finish() {
        print("AppCordinator finish")
        finishDelegate?.condinatorDidFinish(childCoordinatoro: self)
    }
}

// MARK: - Navigation
private extension OnbordingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnbordingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
