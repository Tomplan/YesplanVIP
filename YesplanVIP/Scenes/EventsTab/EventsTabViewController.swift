//
//  EventsTabViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EventsTabDisplayLogic: class
{
  func displaySomething(viewModel: EventsTab.Something.ViewModel)
}

class EventsTabViewController: UIViewController, UICollectionViewDelegateFlowLayout, EventsTabDisplayLogic
{
  
  var interactor: EventsTabBusinessLogic?
  var router: (NSObjectProtocol & EventsTabRoutingLogic & EventsTabDataPassing)?
    var v = EventsTabView()
    var displayedEvents: [EventsTab.Something.ViewModel.DisplayedEvent] = []
    var displayedStatuses: [String:String] = [:]
    var displayedProfiles: [String:String] = [:]
    
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
    let interactor = EventsTabInteractor()
    let presenter = EventsTabPresenter()
    let router = EventsTabRouter()
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        doSomething()

        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        v.collectionView.dataSource = self
  }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        doSomething()
//        
//        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        v.collectionView.dataSource = self
//        print("v.collectionView.dataSource: ", v.collectionView.dataSource)
//    }
    
  // MARK: Do something
  
//  @IBOutlet weak var basic: UITextField!
    
    @objc private func refresh() {
        
        doSomething()
    }
    
  func doSomething() {
    
    let request = EventsTab.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: EventsTab.Something.ViewModel ) {
    
    displayedEvents = viewModel.displayedEvents
    displayedProfiles = viewModel.displayedProfiles
    displayedStatuses = viewModel.displayedStatuses
    self.v.collectionView.reloadData()
    self.v.refreshControl.endRefreshing()
  }
}

