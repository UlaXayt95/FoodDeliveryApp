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


private extension OnbordingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .cyan
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .green
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .brown
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewControler = OnbordingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewControler, animated: true)
    }
}
