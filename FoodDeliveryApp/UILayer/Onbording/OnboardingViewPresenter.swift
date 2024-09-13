//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 19.08.2024.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onoardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
  
    
    //MARK: - PROPERTIES
    weak var coordinator: OnbordingCoordinator!
    
    init(coordinator: OnbordingCoordinator!) {
        self.coordinator = coordinator
    }
    func onoardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
