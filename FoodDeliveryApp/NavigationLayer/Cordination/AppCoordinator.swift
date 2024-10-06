//
//  AppCordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 14.08.2024.
//

import UIKit


class AppCoordinator: Cordinator {
    
    private let userStorage =  UserStorage.shared
    private let factory = SceneFactory.self
    
    
    override func start() {
        UserDefaults.standard.removeObject(forKey: "passedOnboarding")
        if userStorage.passedOnboarding{
            showMainFlow()
       } else {
        showOnbordingFlow()
      }
//        let loginVC = LoginViewController()
//        navigationController?.pushViewController(loginVC, animated: true)
    }
    override func finish() {
        print("AppCordinator finish")
    }
}

//MARK: - Navigation
private extension AppCoordinator {
    func showOnbordingFlow() {
        guard let navigationController = navigationController else {return}
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else {return}
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func condinatorDidFinish(childCoordinatoro: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatoro)
        switch childCoordinatoro.type{
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
