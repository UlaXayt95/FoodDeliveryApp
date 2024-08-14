//
//  AppCordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 14.08.2024.
//

import UIKit

class AppCoordinator: Cordinator {
    
    
    override func start() {
        showOnbordingFlow()
    }
    override func finish() {
        print("AppCordinator finish")
    }
}

//MARK: - Navigation
private extension AppCoordinator {
    func showOnbordingFlow() {
        guard let navigationController = navigationController else {return}
        let onbordimgCoordinator = OnbordingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onbordimgCoordinator)
        onbordimgCoordinator.start()
        
        
    }
    func showMainFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func condinatorDidFinish(childCoordinatoro: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatoro)
        switch childCoordinatoro.type{
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
