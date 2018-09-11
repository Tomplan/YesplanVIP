//
//  WelcomeViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 8/09/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.

import UIKit

import Cartography
import Squeaky
import PureLayout

protocol WelcomeDisplayLogic: AnyObject {
  func displaySomething(viewModel: Welcome.Something.ViewModel)
}

// MARK: - Properties and initialization

public class WelcomeViewController: UIViewController, WelcomeDisplayLogic {
    
    var welcomeView: WelcomeView = {
        let view = WelcomeView.newAutoLayout()
        view.backgroundColor = .clear
        return view
    }()
    
    var didSetupConstraints = false

  public var interactor: WelcomeBusinessLogic?
  public var router: (WelcomeRoutingLogic & WelcomeDataPassing)?

  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
}

// MARK: - Object lifecycle

extension WelcomeViewController {
  override public func viewDidLoad() {
    super.viewDidLoad()
    setupViewConfiguration()
  }
}

// MARK: - VIP configuration

private extension WelcomeViewController {
  func setup() {
    let viewController = self
    let interactor = WelcomeInteractor()
    let presenter = WelcomePresenter()
    let router = WelcomeRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}

// MARK: - View configuration

extension WelcomeViewController: ViewConfigurable {
  public func setupViewHierarchy() {
    // Mark: this one we're not gonna use!!!! Forget about it!!!!
//    print("func WelcomeViewController.setupViewHierarchy")

    }

  public func setupViews() {
    print("func WelcomeViewController.setupViews")
    
    // setup title
    
    title = NSLocalizedString("Welcome", comment: String(describing: WelcomeViewController.self))
    
    // Mark: Setup containerView
    view.addSubview(welcomeView)
    
    view.setNeedsUpdateConstraints() // bootstrap Auto Layout
//    self.welcomeView.loginAction = login
  }

  public func setupConstraints() {
    print("func WelcomeViewController.setupConstraints")
  
    if (!didSetupConstraints) {

        welcomeView.autoMatch(.width, to: .width, of: view)
        welcomeView.autoMatch(.height, to: .height, of: view)

        didSetupConstraints = true
    }
    
    super.updateViewConstraints()
    }
}

// MARK: - Public API

extension WelcomeViewController {
  func displaySomething(viewModel: Welcome.Something.ViewModel) {
    //nameTextField.text = viewModel.name
  }
}

// MARK: - Private API

private extension WelcomeViewController {
    func login()
    {
//        let companyUrl = loginView.companyURLTextField.text
//        let apiKey = loginView.apiKeyTextField.text
//        let request = Login.EnterLogin.Request(companyURL: companyUrl, apiKey: apiKey)
//        interactor?.loginPressed(request: request)
    }
}
