//
//  ToDosDetailViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ToDosDetailDisplayLogic: class
{
  func displaySomething(viewModel: ToDosDetail.Something.ViewModel)
}

class ToDosDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, ToDosDetailDisplayLogic
{
  var interactor: ToDosDetailBusinessLogic?
  var router: (NSObjectProtocol & ToDosDetailRoutingLogic & ToDosDetailDataPassing)?
    var v = ToDosDetailView()
    var displayedToDos: [ToDosDetail.Something.ViewModel.ToDoDetail] = [ToDosDetail.Something.ViewModel.ToDoDetail(header: String(), rows: [String()])]

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
    let interactor = ToDosDetailInteractor()
    let presenter = ToDosDetailPresenter()
    let router = ToDosDetailRouter()
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
    override func loadView() {
        print("ToDo Detail loadView")
        view = v }

  override func viewDidLoad()
  {
    super.viewDidLoad()
    print("ToDo Detail viewDidLoad")

    doSomething()
    v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    v.collectionView.dataSource = self
    v.collectionView.delegate = self
  }
    @objc private func refresh() {
        print("ToDo Detail refresh")

        doSomething()
    }
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    print("ToDo Detail doSomething")
    let request = ToDosDetail.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ToDosDetail.Something.ViewModel)
  {
    print("ToDo Detail displaySomething")

    displayedToDos = viewModel.sections
    self.v.collectionView.reloadData()
    self.v.refreshControl.endRefreshing()
    
    }
}