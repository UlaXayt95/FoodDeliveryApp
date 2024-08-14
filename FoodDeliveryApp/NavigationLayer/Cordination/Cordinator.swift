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

protocol TabCarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController? {get set}
}

class Cordinator: CoordinatorProtocol {
    var childCordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(childCordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), type: CoordinatorType, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.childCordinators = childCordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("Coordinator deinited \(type)")
        childCordinators.forEach{ $0.finishDelegate = nil }
        childCordinators.removeAll()
    }
    
    func start() {
        print("Coordinator start")
    }
    
    func finish() {
        print("Cordinator finish")
    }
    
    
}
