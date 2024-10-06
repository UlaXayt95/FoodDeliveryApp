//
//  FDButton.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 06.10.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case grey
}

class FDButton: UIView {
    
    private let button = UIButton()
    var action: (() ->  Void)?
    var Scheme: FDButtonColorSchemes = .white {
        didSet{
            setColorScheme(scheme: Scheme)
        }
    }
 
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.Bold.size(of: 18)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc private func buttonPressed(){
        guard let action = self.action else {return}
        action()
    }
    
    private func setColorScheme(scheme: FDButtonColorSchemes = .white){
        switch scheme{
        case .white:
            button.backgroundColor = AppColor.white
            button.setTitleColor(AppColor.accentOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColor.accentOrange
            button.setTitleColor(AppColor.white, for: .normal)
        case .grey:
            button.backgroundColor = AppColor.grey
            button.setTitleColor(AppColor.black, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }

}
