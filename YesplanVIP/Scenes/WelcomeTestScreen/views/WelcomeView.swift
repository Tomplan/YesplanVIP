//
//  WelcomeView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 8/09/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.

import UIKit

import Cartography
import Squeaky
import PureLayout
import SearchTextField

// MARK: - Properties and initialization

public class WelcomeView: UIView {
    
    var loginAction: (() -> Void)?
    var signupAction: (() -> Void)?
    
    // View properties
    let containerView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .clear
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "yesplanNB 180x180.png")
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor.black
        return iv
    }()
    
    let companyURLTextField: SearchTextField = {
        let tf = SearchTextField(placeHolder: "'your_organization.yesplan.be'")
        tf.autocapitalizationType = .none
        tf.inlineMode = true
        tf.filterStrings(UserDefaults.standard.array(forKey: "autofillCompanyURL") as! [String])
        tf.theme = SearchTextFieldTheme.darkTheme()
        return tf
    }()
    
    let apiKeyTextField: SearchTextField = {
        let tf = SearchTextField(placeHolder: "API_Key")
        tf.inlineMode = true
        tf.filterStrings(UserDefaults.standard.array(forKey: "autofillApiKey") as! [String])
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
    
    var viewsInStack = [UIView]()
    
    var stackView = UIStackView()
    
    var didSetupConstraints = false
    
  public init() {
    super.init(frame: .zero)
    setupViewConfiguration()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViewConfiguration()
  }
}

// MARK: - Object lifecycle

extension WelcomeView {
//    override public func layoutSubviews() {
//     super.layoutSubviews()
//  
//      self.layer.cornerRadius = self.frame.height / 2
//   }
}

// MARK: - View configuration

extension WelcomeView: ViewConfigurable {
  public func setupViewHierarchy() {
    print("func WelcomeView.setupViewHierarchy")
    
//     addSubview(mySubView)
  }

  public func setupViews() {
    print("func WelcomeView.setupViews")
    
    addSubview(containerView)
    
    viewsInStack = [companyURLTextField
                    ,apiKeyTextField
                    ,loginButton
                    ,signupButton
    ]
    stackView = createStackView(views: viewsInStack)
    
    
    addSubview(backgroundImageView)
    addSubview(stackView)
    
    
    setNeedsUpdateConstraints() // bootstrap Auto Layout
 
  }

  public func setupConstraints() {
    print("func WelcomeView.setupConstraints")
    
    if (!didSetupConstraints) {
        

        containerView.autoMatch(.width, to: .width, of: self)
        containerView.autoMatch(.height, to: .height, of: self)
        
        stackView.autoCenterInSuperview()

        backgroundImageView.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        backgroundImageView.autoPinEdge(.bottom, to: .top, of: stackView, withOffset: 20)

        backgroundImageView.autoSetDimensions(to: CGSize(width: 100, height: 100))

        companyURLTextField.autoPinEdge(.top, to: .bottom, of: backgroundImageView, withOffset: 10)

        apiKeyTextField.autoPinEdge(.top, to: .bottom, of: companyURLTextField, withOffset: 10)

        loginButton.autoPinEdge(.top, to: .bottom, of: apiKeyTextField, withOffset: 10)
        
        signupButton.autoPinEdge(.top, to: .bottom, of: loginButton, withOffset: 10)

        didSetupConstraints = true
    }
  }
}

// MARK: - Public API

extension WelcomeView {

}

// MARK: - Private API

private extension WelcomeView {

}
