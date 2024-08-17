//
//  AppCordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 14.08.2024.
//

import UIKit

class AppCoordinator: Cordinator {
    
    
    override func start() {
        //showOnbordingFlow()
        showMainFlow()
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
        guard let navigationController = navigationController else {return}
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "star"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "star"), tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "star"), tag: 2)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: profileNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "star"), tag: 3)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        addChildCoordinator(homeCoordinator)
        
        let tabBarControllers = [orderNavigationController, listNavigationController,
                                 homeNavigationController, profileNavigationController
        ]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        navigationController.pushViewController(tabBarController, animated: true)
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
