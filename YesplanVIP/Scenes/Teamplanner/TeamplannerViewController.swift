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

protocol TeamplannerTabDisplayLogic: class
{
  func displaySomething(viewModel: TeamplannerTab.Something.ViewModel)
}

class TeamplannerTabViewController: UIViewController, TeamplannerTabDisplayLogic
{
  var interactor: TeamplannerTabBusinessLogic?
  var router: (NSObjectProtocol & TeamplannerTabRoutingLogic & TeamplannerTabDataPassing)?
    var v = TeamplannerTabView()
//var displayedResourcebookings: [TeamplannerTab.Something.ViewModel.Item] = []
//    var resourcebookings: Set<TeamplannerTab.Something.ViewModel.Item> = []
  // MARK: Object lifecycle
    var sections = [TeamplannerTab.Something.ViewModel.Item]()
    
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
    let interactor = TeamplannerTabInteractor()
    let presenter = TeamplannerTabPresenter()
    let router = TeamplannerTabRouter()
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
  
  // MARK: View lifecycle
    override func loadView() { view = v }

  override func viewDidLoad()
  {
    super.viewDidLoad()
    view.backgroundColor = UIColor.red
    
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
    
    self.title = "Teamplanner"
    
    NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange), name: UserDefaults.didChangeNotification, object: nil)
    
    doSomething()
    
    v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    v.collectionView.dataSource = self
  }
  
  // MARK: Do something
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func userDefaultsDidChange(){
        doSomething()
    }
    
    @objc func addTapped(sender: AnyObject) {
        if let url = URL(string:UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                _ =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
  //@IBOutlet weak var nameTextField: UITextField!
    @objc private func refresh() {
        doSomething()
    }
    
  func doSomething()
  {
    let request = TeamplannerTab.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: TeamplannerTab.Something.ViewModel)
  {
//    var setje: Set<TeamplannerTab.Something.ViewModel.Displ> = []
//    for booking in viewModel.toVC {
////        print("booking: ", booking)
//        setje.insert(booking)
//    }
//    print(setje)
//    let f = Dictionary(grouping: setje, by: { $0.date })
//
//    var items: [String:[TeamplannerTab.Something.ViewModel.Displ]] = [:]
//    for (key, value) in f {
////        print(key, ": ",  value)
//        let valueSorted = value.sorted{ $0.start <  $1.start }
//        items[key] = valueSorted
//    }
    /// miljaar da had wa in ver ik dees stoem lentje gevonne had
//    self.resourcebookings = []
//    /// ja da hi veu dus, klowete
//
//    for (key, value) in items {
//        self.resourcebookings.insert(TeamplannerTab.Something.ViewModel.DisplayedResourcebooking(date: key, resourcebookings: value))
//    }
//    displayedResourcebookings = Array(viewModel.sections.sorted(by: { $0.header < $1.header }))
//    displayedResourcebookings = Array(self.resourcebookings.sorted(by: { $0.date < $1.date }))
    
//    print(displayedResourcebookings)
    sections = viewModel.sections
    self.v.collectionView.reloadData()
    self.v.refreshControl.endRefreshing()
  }
}
