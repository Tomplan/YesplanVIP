//
//  LoginView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    var loginAction: (() -> Void)?
    var signupAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        let stackView = createStackView(views: [emailTextField,
                                                passwordTextField,
                                                loginButton,
                                                signupButton])
        addSubview(backgroundImageView)
        addSubview(stackView)
//        backgroundImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        backgroundImageView.setAnchor(top: nil, left: nil, bottom: emailTextField.topAnchor, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: -50 , paddingRight: 100)
        backgroundImageView.setAnchor(width: 100, height: 100)
//        backgroundImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        stackView.setAnchor(width: self.frame.width/1.2, height: 210)
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
                iv.image = UIImage(named: "yesplanNB 180x180.png")
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor.black
        return iv
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField(placeHolder: "'your_organization.yesplan.be'")
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField(placeHolder: "API_Key")
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(title: "Login", borderColor: .greenBorderColor)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(title: "Sign Up", borderColor: .redBorderColor)
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLogin() {
        loginAction?()
    }
    
    @objc func handleSignup() {
        signupAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
