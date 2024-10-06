//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Улугбек Хайтметов on 17.09.2024.
//

import UIKit

class BottomView: UIView {
    
    private let label = UILabel()
    private let view1 = UIView()
    private let view2 = UIImageView()
    private let button1 = UIButton()
    private let button2 = UIButton()
    
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupLabel()
        setupView1()
        setupView2()
        setupButton1()
        setupButton2()
        
    }
    private func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.Regular.size(of: 14)
        label.textColor = AppColor.bottomViewGrey
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)
        ])
        
    }
    private func setupView1() {
        self.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = AppColor.bottomViewGrey.withAlphaComponent(0.3)
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0),
            view1.leftAnchor.constraint(equalTo: self.leftAnchor ),
            view1.rightAnchor.constraint(equalTo: label.leftAnchor, constant: -12),
            view1.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    private func setupView2() {
        self.addSubview(view2)
        view2.image = UIImage(named: "BottomViewImage")
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 18),
            view2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -60),
            view2.heightAnchor.constraint(equalToConstant: 150),
            view2.widthAnchor.constraint(equalToConstant: 282)
        ])
        
        
    }
    
    private func setupButton1() {
        self.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setImage(UIImage(named: "google"), for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)
        ])
        
    }
    private func setupButton2() {
        self.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setImage(UIImage(named: "facebook"), for: .normal)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button2.rightAnchor.constraint(equalTo: button1.leftAnchor, constant: -20)
        ])
    }
    
}

private extension BottomView {
    @objc func button1Tapped() {
        button1Action?()
    }
    @objc func button2Tapped() {
        button2Action?()
    }
}

//#Preview("BottomView", traits: .fixedLayout(width: 400, height: 150)) {
//    BottomView()
//}
