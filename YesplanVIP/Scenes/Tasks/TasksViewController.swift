//
//  TasksViewController.swift
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
import UserNotifications

protocol TasksDisplayLogic: class
{
  func displaySomething(viewModel: TasksTab.Something.ViewModel)
}

class TasksViewController: UIViewController, UICollectionViewDelegateFlowLayout, TasksDisplayLogic
{
  var interactor: TasksBusinessLogic?
  var router: (NSObjectProtocol & TasksRoutingLogic & TasksDataPassing)?
    var v = TasksTabView()
    var displayedTasks: [TasksTab.Something.ViewModel.DisplayedTask] = []
    var displayedStatuses: [String:String] = [:]

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
    let interactor = TasksInteractor()
    let presenter = TasksPresenter()
    let router = TasksRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//  {
//    if let scene = segue.identifier {
//      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//      if let router = router, router.responds(to: selector) {
//        router.perform(selector, with: segue)
//      }
//    }
//  }
//
    
  // MARK: View lifecycle
    
    override func loadView() { view = v }

  override func viewDidLoad() {
//    print("viewDidLoad")
    super.viewDidLoad()
    
    
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
    button.setImage(#imageLiteral(resourceName: "yesplanNB 180x180"), for: .normal)
    button.setTitle("", for: .normal)
    button.tintColor = UIColor.yellow
    let widthConstraint = button.widthAnchor.constraint(equalToConstant: 32)
    let heightConstraint = button.heightAnchor.constraint(equalToConstant: 32)
    heightConstraint.isActive = true
    widthConstraint.isActive = true
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

    self.title = "Tasks"
    
    NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange), name: UserDefaults.didChangeNotification, object: nil)
    
    getTasks()
    v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    v.collectionView.dataSource = self
  }
    
    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear")
        super.viewWillAppear(animated)
        getTasks()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear")
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func userDefaultsDidChange(){
//        print("userDefaultsDidChange")
        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        getTasks()
//        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        v.collectionView.dataSource = self
    }
    
    @objc func addTapped(sender: AnyObject) {
        print("addTapped")
//        NotificationCenter.default.removeObserver(self)
        if let url = URL(string:UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                _ =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc private func refresh() {
//        print("refresh")
        getTasks()
//        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        v.collectionView.dataSource = self
    }
    
    // MARK: getTasks()

  func getTasks() {

    let request = TasksTab.Something.Request()
    interactor?.getTasks(request: request)
  }
  
  func displaySomething(viewModel: TasksTab.Something.ViewModel) {
    
    displayedTasks = viewModel.displayedTasks
    displayedStatuses = viewModel.displayedStatuses
    
    if viewModel.error != nil {
        let alert = UIAlertController(title: "Alert", message: "\(viewModel.error!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: { action in
//            self.getTasks()
        }))
        self.present(alert, animated: true)
    }
    
//    print("displayedTasks:", displayedTasks)
    
   
    self.v.collectionView.reloadData()
    self.v.refreshControl.endRefreshing()
  }
}
