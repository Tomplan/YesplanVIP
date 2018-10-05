//
//  LoginViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
//import Cartography
import Squeaky
import PureLayout

protocol LoginDisplayLogic: AnyObject
{
  func displaySomething(viewModel: Login.EnterLogin.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
 
    let defaults = UserDefaults.standard

    var autofillCompanyURL: [String] = UserDefaults.standard.array(forKey: "autofillCompanyURL") as! [String]

    var autofillApiKey: [String] = UserDefaults.standard.array(forKey: "autofillApiKey") as! [String]
    var autofillUser: [String] = UserDefaults.standard.array(forKey: "autofillUser") as! [String]

    // view:
    
    let loginView: LoginView = {
        let view = LoginView.newAutoLayout()
        view.backgroundColor = .clear
        return view
    }()

    var didSetupConstraints = false


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
}

  // MARK: View lifecycle

extension LoginViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
    }
}

// MARK: - VIP configuration

private extension LoginViewController {
    func setup()
  {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor

  }
}



  // MARK: View lifecycle
  
//  override func viewDidLoad()
//  {
//    super.viewDidLoad()
//    title = NSLocalizedString("Login", comment: String(describing: LoginViewController.self))
//    setupView()
//
//    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = true
//    }

extension LoginViewController: ViewConfigurable {
    public func setupViewHierarchy() {
        // Mark: this one we're not gonna use!!!! Forget about it!!!!
        //    print("func WelcomeViewController.setupViewHierarchy")
        
    }
    
    public func setupViews() {
//        print("func LoginViewController.setupViews")
        
        // setup title
        
        title = NSLocalizedString("Login", comment: String(describing: LoginViewController.self))
        
        // Mark: Setup containerView
        
        self.loginView.loginAction = login
        self.loginView.signupAction = signupPressed
        view.addSubview(loginView)
        
        view.setNeedsUpdateConstraints() // bootstrap Auto Layout
    }
    
    public func setupConstraints() {
        
        if (!didSetupConstraints) {
            
            loginView.autoMatch(.width, to: .width, of: view)
            loginView.autoMatch(.height, to: .height, of: view)
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}

private extension LoginViewController {
    func signupPressed() {
        // 1
        print("LoginViewController signupPressed")
//        let signUpVC = SignUpController()
//        present(signUpVC, animated: true, completion: nil)
    }
    

  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func login()
  {
    let companyUrl = loginView.companyURLTextField.text
    let apiKey = loginView.apiKeyTextField.text
    let user = loginView.userTextField.text
    let request = Login.EnterLogin.Request(companyURL: companyUrl, apiKey: apiKey, user: user)
    interactor?.loginPressed(request: request)
  }
}

extension LoginViewController {
  func displaySomething(viewModel: Login.EnterLogin.ViewModel)
  {
    if viewModel.success == true {
        // Mark: Set user is logged in
        self.defaults.set(true, forKey: "LOGGED_IN")
        
        // Mark: append companyUrl to autofill
        autofillCompanyURL.append(loginView.companyURLTextField.text!)
        autofillCompanyURL = Array(Set(autofillCompanyURL))
        self.defaults.set(autofillCompanyURL, forKey: "autofillCompanyURL" )

        // Mark: append apiKey to autofill
        autofillApiKey.append(loginView.apiKeyTextField.text!)
        autofillApiKey = Array(Set(autofillApiKey))
        self.defaults.set(autofillApiKey, forKey: "autofillApiKey" )

        // Mark: append user to autofill
        autofillUser.append(loginView.userTextField.text!)
        autofillUser = Array(Set(autofillUser))
        self.defaults.set(autofillUser, forKey: "autofillUser" )
        
        //Mark: switch to MainScreen
        AppDelegate.shared.rootViewController.switchToMainScreen()
//        router?.routeToSomewhere()

        
    } else {
        let alert = UIAlertController(title: "Alert", message: "\(viewModel.error!)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
        // Mark: user has to add new apiKey
//        loginView.companyURLTextField.text = nil
        loginView.apiKeyTextField.text = nil
        loginView.userTextField.text = nil

        
    }
  }
}
