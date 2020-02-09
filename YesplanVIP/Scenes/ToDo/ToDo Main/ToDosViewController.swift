//
//  ToDosViewController.swift
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

protocol ToDosDisplayLogic: class
{
    func displaySomething(viewModel: ToDosTab.Something.ViewModel)
}

class ToDosViewController: UIViewController, UICollectionViewDelegateFlowLayout, ToDosDisplayLogic
{
//    private let notificationPublisher = NotificationPublisher()

    var interactor: ToDosBusinessLogic?
    var router: (NSObjectProtocol & ToDosRoutingLogic & ToDosDataPassing)?
    var v = ToDosTabView()
    var displayedToDos: [ToDosTab.Something.ViewModel.DisplayedToDo] = []
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
        let interactor = ToDosInteractor()
        let presenter = ToDosPresenter()
        let router = ToDosRouter()
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
        
        self.title = "ToDo"
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange), name: UserDefaults.didChangeNotification, object: nil)
        
        doSomething()
        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        v.collectionView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doSomething()
        v.collectionView.dataSource = self
        v.collectionView.delegate = self
    }
    
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
    
    func doSomething() {
        
        let request = ToDosTab.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: ToDosTab.Something.ViewModel) {
        
        displayedToDos = viewModel.displayedToDos
        displayedStatuses = viewModel.displayedStatuses

//        print("displayedToDos:", displayedToDos)
        
        
//        let center = UNUserNotificationCenter.current()
//        center.removeAllDeliveredNotifications()
//        center.removeAllPendingNotificationRequests()
        
//        center.getPendingNotificationRequests(completionHandler: { requests in
//            print("*requests*")
//            for request in requests {
//                print("(request:", request)
//            }
//        })
        
        
//        for toDos in displayedToDos {
//            for toDo in toDos.toDos {
//
//                if let myDate = toDo.due {
//
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//                let date = dateFormatter.date(from:myDate)!
//                let calendar = Calendar.current
//                // first notification
//                    var notificationDate = calendar.date(byAdding: .hour, value: -1, to: date)!
////                    print("notificationDate:", notificationDate)
//                    var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
//                    notificationPublisher.sendNotification(title: toDo.name ?? "name", subtitle: "due: \(toDo.due?.convertDateString(dateFormat: "EEEE, dd MM yyyy") ?? "")", body: toDo.description ?? "description", badge: 1, delayInterval: nil, date: components, id: "1 \(toDo.id)")
//
//                    // second notification
//                    notificationDate = calendar.date(byAdding: .day, value: -1, to: date)!
////                    print("notificationDate:", notificationDate)
//                    components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
//                    notificationPublisher.sendNotification(title: toDo.name ?? "name", subtitle: "due: \(toDo.due?.convertDateString(dateFormat: "EEEE, dd MM yyyy") ?? "")", body: toDo.description ?? "description", badge: 1, delayInterval: nil, date: components, id: "2 \(toDo.id)")
//                }
//            }
//        }
        
//        center.getPendingNotificationRequests(completionHandler: { requests in
//            print("requests")
//            for request in requests {
//                print("(request:", request)
//            }
//        })
        if viewModel.error != nil {
               let alert = UIAlertController(title: "Alert", message: "\(viewModel.error!)", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
               alert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: { action in
               }))
               self.present(alert, animated: true)
           }
        
        self.v.collectionView.reloadData()
        self.v.refreshControl.endRefreshing()
    }
}