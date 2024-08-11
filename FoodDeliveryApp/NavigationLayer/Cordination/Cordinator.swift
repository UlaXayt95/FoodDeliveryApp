//
//  Cordinator.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 12.08.2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set}
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinaor: CoordinatorProtocol) {
        childCordinators.append(childCoordinaor)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCordinators = childCordinators.filter{ $0 !== childCoordinator}
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func condinatorDidFinish(childCoordinatoro: CoordinatorProtocol)
}
