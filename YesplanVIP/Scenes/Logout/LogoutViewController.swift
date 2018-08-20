//
//  LogoutViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 20/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LogoutDisplayLogic: class
{
  func displaySomething(viewModel: Logout.Something.ViewModel)
}

class LogoutViewController: UIViewController, LogoutDisplayLogic
{
  var interactor: LogoutBusinessLogic?
  var router: (NSObjectProtocol & LogoutRoutingLogic & LogoutDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = LogoutInteractor()
    let presenter = LogoutPresenter()
    let router = LogoutRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
//    doSomething()
    setupView()

  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
    func doSomething(){
    let request = Logout.Something.Request()
    interactor?.doSomething(request: request)
  }
    func setupView(){
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
    }
    @objc
    private func logout() {
        print("MainTabBarViewController logout")
    
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToLogout()
    }
  func displaySomething(viewModel: Logout.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
