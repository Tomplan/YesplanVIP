//
//  MainTabBarViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 17/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController { }

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .selected)
        UITabBar.appearance().barTintColor = UIColor.black
        // UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupTabBar() {
        
        // Mark: Create Navigation Controllers
        
        self.delegate = self
        let VC01 = createNavController(vc: EventsTabViewController(), title: "Events", selected: #imageLiteral(resourceName: "Events Selected"), unselected: #imageLiteral(resourceName: "Events Unselected"))
        let VC02 = createNavController(vc: TasksViewController(), title: "Tasks", selected: #imageLiteral(resourceName: "Tasks Selected"), unselected: #imageLiteral(resourceName: "Tasks Unselected"))
        let VC03 = createNavController(vc: ContactsViewController(), title: "Contacts", selected: #imageLiteral(resourceName: "Contacts Selected"), unselected: #imageLiteral(resourceName: "Contacts Unselected"))
        let VC04 = createNavController(vc: TeamplannerViewController(), title: "Teamplanner", selected: #imageLiteral(resourceName: "Teamplanner Selected"), unselected: #imageLiteral(resourceName: "Teamplanner Unselected"))
        let VC05 = createNavController(vc: ToDoViewController(), title: "ToDo", selected: #imageLiteral(resourceName: "To Do Selected"), unselected: #imageLiteral(resourceName: "To Do Unselected"))
        let VC06 = createNavController(vc: UserTabViewController(), title: "User", selected: #imageLiteral(resourceName: "User Selected"), unselected: #imageLiteral(resourceName: "User Unselected"))
        let VC07 = createNavController(vc: HelpViewController(), title: "Help", selected: #imageLiteral(resourceName: "Help Selected"), unselected: #imageLiteral(resourceName: "Help Unselected"))
        let VC08 = createNavController(vc: LogoutViewController(), title: "Logout", selected: #imageLiteral(resourceName: "Help Selected"), unselected: #imageLiteral(resourceName: "Help Unselected"))

        let controllers = [VC01, VC02, VC03, VC04, VC05, VC06, VC07, VC08]
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
            tabOrder = (defaults.object(forKey: "tabOrder") as? [Int])
        } else {
            tabOrder = [0, 1, 2, 3, 4, 5, 6, 7]
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
            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
        }
    }
}

extension MainTabBarViewController {
    
    func createNavController(vc: UIViewController, title: String ,selected: UIImage, unselected: UIImage) -> UINavigationController {

        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
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

