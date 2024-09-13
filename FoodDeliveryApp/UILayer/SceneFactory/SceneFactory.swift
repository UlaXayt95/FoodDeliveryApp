//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 10.09.2024.
//

import UIKit

struct SceneFactory {
    // MARK: - Onboarding Flow
    static func makeOnboardingFlow(coordinator: AppCoordinator,finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onbordimgCoordinator = OnbordingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onbordimgCoordinator)
        onbordimgCoordinator.start()
    }
    
    
    
    static func makeOnbordingScene(coordinator: OnbordingCoordinator) -> OnbordingViewController {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(resource: .chickenLeg1)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
       
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(resource: .shipped1)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(resource: .medal1)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"
        
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.imageToShow = UIImage(resource: .creditCard1)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourthVC.buttonText = "Cool!"
        
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewControler = OnbordingViewController(pages: pages, viewOutput: presenter)
        
        return viewControler
    }
    
    // MARK: - Main Flow
    
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController{
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCordinator(type: .home , navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "star"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "star"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "star"), tag: 2)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: profileNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "star"), tag: 3)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        coordinator.addChildCoordinator(homeCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController
        ]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        return tabBarController
    }
}
