//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 17.09.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
      
    }
    
    func facebookPressed(){
       print("facebook")
    }
    func googlePressed(){
        print("google")
        
    }
}

private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
    }
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.button1Action = googlePressed
        bottomView.button2Action = facebookPressed
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}

#Preview("loginVC"){
    LoginViewController()
}

