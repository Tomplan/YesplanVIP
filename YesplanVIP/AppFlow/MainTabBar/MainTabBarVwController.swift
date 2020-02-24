//
//  MainTabBarViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 17/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import UserNotifications

class MainNavigationController: UINavigationController { }


protocol MainTabBarDisplayLogic: class
{
    func displaySomething(viewModel: MainTabBar.Something.ViewModel)
}

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    private let notificationPublisher = NotificationPublisher()

    var interactor: MainTabBarBusinessLogic?
    var router: (NSObjectProtocol & MainTabBarRoutingLogic & MainTabBarDataPassing)?
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
        let interactor = MainTabBarInteractor()
        let presenter = MainTabBarPresenter()
        let router = MainTabBarRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController as? MainTabBarDisplayLogic
        router.viewController = viewController
        router.dataStore = interactor
      }
    
      // MARK: Routing
    
//      override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//      {
//        if let scene = segue.identifier {
//          let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//          if let router = router, router.responds(to: selector) {
//            router.perform(selector, with: segue)
//          }
//        }
//      }
    
      // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 39
//        notificationPublisher.sendNotification(title: "joep", subtitle: "fuck yes", body: "THIS IS WORKING", badge: 1, delayInterval: nil, date: dateComponents )
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .selected)
        UITabBar.appearance().barTintColor = UIColor.black
        setupTabBar()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupTabBar() {
        print("setupTabBar")
        // Mark: Create Navigation Controllers
        
        self.delegate = self
        let VC01 = createNavController(vc: EventsTabViewController(), title: "Events", selected: #imageLiteral(resourceName: "Events Selected.png"), unselected: #imageLiteral(resourceName: "Events Unselected.png"))
        let VC02 = createNavController(vc: TasksViewController(), title: "Tasks", selected: #imageLiteral(resourceName: "Tasks Selected"), unselected: #imageLiteral(resourceName: "Tasks Unselected"))
//        let VC03 = createNavController(vc: ContactsViewController(), title: "Contacts", selected: #imageLiteral(resourceName: "Contacts Selected"), unselected: #imageLiteral(resourceName: "Contacts Unselected"))
        let VC04 = createNavController(vc: TeamplannerTabViewController(), title: "Teamplanner", selected: #imageLiteral(resourceName: "Teamplanner Selected"), unselected: #imageLiteral(resourceName: "Teamplanner Unselected"))
        let VC05 = createNavController(vc: ToDosViewController(), title: "ToDo", selected: #imageLiteral(resourceName: "To Do Selected"), unselected: #imageLiteral(resourceName: "To Do Unselected"))
//        let VC06 = createNavController(vc: UserTabViewController(), title: "User", selected: #imageLiteral(resourceName: "User Selected"), unselected: #imageLiteral(resourceName: "User Unselected"))
//        let VC07 = createNavController(vc: HelpViewController(), title: "Help", selected: #imageLiteral(resourceName: "Help Selected"), unselected: #imageLiteral(resourceName: "Help Unselected"))
        let VC08 = createNavController(vc: LogoutViewController(), title: "Logout", selected: #imageLiteral(resourceName: "Help Selected"), unselected: #imageLiteral(resourceName: "Help Unselected"))

        let controllers = [
            VC01
            , VC02
//            , VC03
            , VC04
            , VC05
//            , VC06
//            , VC07
            , VC08
        ]
        setViewControllers(controllers, animated: false)
        
        // Mark: Create tabBarItems
        
        if viewControllers != nil {
            for i in 0 ..< viewControllers!.count {
                let vc: UIViewController = viewControllers![i]
                vc.tabBarItem.tag = i
            }
        }
        
        // Mark: Create defaults
        
        let defaults: UserDefaults = UserDefaults.standard
        
        // Mark: Create tabOrder
        
        var tabOrder: [Int]?

        if defaults.bool(forKey: "tabOrderCheck") {
            defaults.set(true, forKey: "tabOrderCheck")
            tabOrder = (defaults.object(forKey: "tabOrder") as? [Int]) // back in if more tabs needed!!!

        } else {
            tabOrder = [0, 2, 1, 3, 4, 5, 6, 7]
//            tabOrder = [0, 1, 3, 4, 7]
            defaults.set(tabOrder, forKey: "tabOrder")
            defaults.set(true, forKey: "tabOrderCheck")
        }
        // Mark: Update vcOrder
        
        if tabOrder != nil {
            var vcOrder: [UIViewController] = []
            for tag: Int in tabOrder! {
                for vc in viewControllers! {
                    if vc.tabBarItem.tag == tag {
                        vcOrder.append(vc)
                    }
                }
            }
            viewControllers = vcOrder
        }
        
        // Mark: size items insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets.init(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    func displaySomething(viewModel: MainTabBar.Something.ViewModel)
      {
      }
}

extension MainTabBarViewController {
    
    func createNavController(vc: UIViewController, title: String ,selected: UIImage, unselected: UIImage) -> UINavigationController {

        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
//        navController.navigationBar.backgroundColor = UIColor.red
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(r: 158, g: 158, b: 158) // color for buttons, text
        navigationBarAppearace.barTintColor = UIColor.black // color for background
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(r: 185, g: 185, b: 185)]
        
//        navController.navigationBar.barStyle = .black // set in info plist
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        navController.tabBarItem.title = title
        
        return navController
    }
}

extension MainTabBarViewController {
    
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        if changed {
            var tabOrder: [Int] = []
            for vc: UIViewController in viewControllers {
                tabOrder.append(vc.tabBarItem.tag)
            }
            let defaults: UserDefaults = UserDefaults.standard
            defaults.set(tabOrder, forKey: "tabOrder")
        }
    }
}

