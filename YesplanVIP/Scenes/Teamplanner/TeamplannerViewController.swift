//
//  TeamplannerViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 13/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TeamplannerDisplayLogic: class
{
  func displaySomething(viewModel: Teamplanner.Something.ViewModel)
}

class TeamplannerViewController: UIViewController, TeamplannerDisplayLogic
{
  var interactor: TeamplannerBusinessLogic?
  var router: (NSObjectProtocol & TeamplannerRoutingLogic & TeamplannerDataPassing)?

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
    let interactor = TeamplannerInteractor()
    let presenter = TeamplannerPresenter()
    let router = TeamplannerRouter()
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
    view.backgroundColor = UIColor.red

    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Teamplanner.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Teamplanner.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}