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
import PromiseKit
import SwiftUI
import MDatePickerView
import YYCalendar
import Network

protocol EventsTabDisplayLogic: class
{
  func displaySomething(viewModel: EventsTab.Something.ViewModel)
}

class EventsTabViewController: UIViewController, UICollectionViewDelegateFlowLayout, EventsTabDisplayLogic
//    ,NetworkCheckObserver
{
//    var networkCheck = NetworkCheck.sharedInstance()
    
//    private var embedController: EmbedController?

    // *************
//
//    @IBOutlet weak var calendarView: CalendarView!
//    @IBOutlet weak var caldatePicker: UIDatePicker!
       
    
    // **************
    
    var datePicker : UIDatePicker = UIDatePicker()
    var toolBar = UIToolbar()

    var interactor: EventsTabBusinessLogic?
    var router: (NSObjectProtocol & EventsTabRoutingLogic & EventsTabDataPassing)?
    var v = EventsTabView()
//    var calView = CalendarView()
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
        
        // Check Network
//        if networkCheck.currentStatus == .satisfied{
//                       //Do something
//            print("Network OK")
//            networkCheck.addObserver(observer: self)
//        } else {
//            popupAlert(title: "Warning", message: "The Internet is not available", actionTitles: ["Dismiss", "Retry Connection"], actions: [
//                {action1 in
//                    self.networkCheck.addObserver(observer: self)
//                },
//                {action2 in
//                self.doSomething()}])
//
//        }
        
        //Swipe Gestures
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            
        leftSwipe.direction = .left
        rightSwipe.direction = .right

        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
        
        // NavigationBarButtons:
        // Yesplan Prefs Button
        let yesplanPrefsButton = UIButton(type: .system)
        yesplanPrefsButton.addTarget(self, action: #selector(yesplanPrefs), for: .touchUpInside)
        yesplanPrefsButton.setImage(#imageLiteral(resourceName: "yesplanNB 180x180"), for: .normal)
        yesplanPrefsButton.setTitle("setup", for: .normal)
        yesplanPrefsButton.tintColor = UIColor.yellow
        let widthConstraintYesplanPrefsButton = yesplanPrefsButton.widthAnchor.constraint(equalToConstant: 32)
        let heightConstraintYesplanPrefsButton = yesplanPrefsButton.heightAnchor.constraint(equalToConstant: 32)
        heightConstraintYesplanPrefsButton.isActive = true
        widthConstraintYesplanPrefsButton.isActive = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: yesplanPrefsButton)
        
        // calendarLeftButton
        let calendarLeftButton = UIButton(type: .system)
        calendarLeftButton.addTarget(self, action: #selector(calendarLeft), for: .touchUpInside)
        calendarLeftButton.setImage(#imageLiteral(resourceName: "CalendarLeft.png"), for: .normal)
        calendarLeftButton.setTitle("", for: .normal)
        calendarLeftButton.tintColor = UIColor.gray
        let widthConstraintCalendarLeftButton = calendarLeftButton.widthAnchor.constraint(equalToConstant: 20)
        let heightConstraintCalendarLeftButton = calendarLeftButton.heightAnchor.constraint(equalToConstant: 20)
        heightConstraintCalendarLeftButton.isActive = true
        widthConstraintCalendarLeftButton.isActive = true
//        let leftbarButtonItem1 = UIBarButtonItem(customView: calendarLeftButton)
        
        // CalendarButton
        let calendarButton = UIButton(type: .system)
        calendarButton.addTarget(self, action: #selector(showCalendar(_:)), for: .touchUpInside)
        calendarButton.setImage(#imageLiteral(resourceName: "Calendar"), for: .normal)
        calendarButton.setTitle("", for: .normal)
        calendarButton.tintColor = UIColor.gray
        let widthConstraintCalendarButton = calendarButton.widthAnchor.constraint(equalToConstant: 20)
        let heightConstraintCalendarButton = calendarButton.heightAnchor.constraint(equalToConstant: 20)
        heightConstraintCalendarButton.isActive = true
        widthConstraintCalendarButton.isActive = true
        let leftbarButtonItem2 = UIBarButtonItem(customView: calendarButton)
        
        // CalendarRightButton
        let calendarRightButton = UIButton(type: .system)
        calendarRightButton.addTarget(self, action: #selector(calendarRight), for: .touchUpInside)
        calendarRightButton.setImage(#imageLiteral(resourceName: "CalendarRight"), for: .normal)
        calendarRightButton.setTitle("", for: .normal)
        calendarRightButton.tintColor = UIColor.gray
        let widthConstraintCalendarRightButton = calendarRightButton.widthAnchor.constraint(equalToConstant: 20)
        let heightConstraintCalendarRightButton = calendarRightButton.heightAnchor.constraint(equalToConstant: 20)
        heightConstraintCalendarRightButton.isActive = true
        widthConstraintCalendarRightButton.isActive = true
//        let leftbarButtonItem3 = UIBarButtonItem(customView: calendarRightButton)

        
//        self.navigationItem.leftBarButtonItems = [leftbarButtonItem1, leftbarButtonItem2, leftbarButtonItem3]
        self.navigationItem.leftBarButtonItems = [leftbarButtonItem2]

        self.title = "Events"
        
    NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange), name: UserDefaults.didChangeNotification, object: nil)
        
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange), name: UserDefaults.didChangeNotification, object: nil)
        doSomething()
        
        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        if #available(iOS 10.0, *) {
//            v.collectionView.prefetchDataSource = self
//        }
        v.collectionView.dataSource = self
        v.collectionView.delegate = self
//        v.collectionView.prefetchDataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            
        if (sender.direction == .left) {
            calendarDayPlus()
        }
            
        if (sender.direction == .right) {
            calendarDayMinus()
        }
    }
    
    @objc func userDefaultsDidChange(){
        doSomething()
    }

        
    @objc func yesplanPrefs(sender: AnyObject) {
        if let url = URL(string:UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                _ =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
//    @State private var wakeUp = Date() // Only from iOS13.0
    
    @objc func calendarLeft(sender: AnyObject) {
        calendarDayMinus()
    }
    
    func calendarDayMinus() {
        datePicker.date = Calendar.current.date(byAdding: .day, value: -1, to: datePicker.date)!
        doSomething()
    }
    
    @objc func calendarRight(sender: AnyObject) {
        calendarDayPlus()
    }
    
    func calendarDayPlus() {
        datePicker.date = Calendar.current.date(byAdding: .day, value: 1, to: datePicker.date)!
        doSomething()
        self.datePicker.removeFromSuperview()
    }
    
    @objc func showCalendar(_ sender: UIButton) {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd"
           
           let calendar = YYCalendar(normalCalendarLangType: .ENG, date: "\(formatter.string(from: Date()))", format: "yyyy-MM-dd") { (date) in
               let formatter = DateFormatter()
               formatter.dateFormat = "yyyy-MM-dd"
               self.datePicker.date = formatter.date(from: date) ?? Date()
                   self.doSomething()
           }
           
//           calendar.dayButtonStyle = .circle
           calendar.dimmedBackgroundColor = UIColor.black
           calendar.dimmedBackgroundAlpha = 0.7
           calendar.headerViewBackgroundColor = UIColor.black
           calendar.bodyViewBackgroundColor = UIColor.black
           calendar.sundayColor = UIColor.red
           calendar.saturdayColor = UIColor.red
           calendar.defaultDayColor = UIColor(red: 120, green: 120, blue: 120, alpha: 0.1)
           calendar.lineSeparatorColor = UIColor.lightGray
//           calendar.selectedDayColor = UIColor.darkGray
//           calendar.headerLabelFont = UIFont(name: "Helvetica", size: 24.0)!
           calendar.headerLabelBackgroundColor = UIColor.black
           calendar.headerLabelTextColor = UIColor.lightGray
           calendar.weekLabelFont = UIFont(name: "Helvetica", size: 16.0)!
           calendar.dayLabelFont = UIFont(name: "Helvetica", size: 16.0)!
           calendar.show()
    }

    @objc private func refresh() {
        doSomething()
    }
    
//    func statusDidChange(status: NWPath.Status) {
//        if status == .satisfied{
//            print("status: ", status)
//                       //Do something
//            print("statusDidChange.Satisfied")
//            popupAlert(title: "Connected to the Internet!", message: "You're Online!", actionTitles: ["OK"], actions: [nil])
//        }else if status == .unsatisfied {
//            print("statusDidChange.Unsatisfied")
//            print("status: ", status)
//
//            networkCheck = NetworkCheck.sharedInstance()
//            popupAlert(title: "Warning", message: "You're Offline!", actionTitles: ["Dismiss"], actions: [nil])
//            
//        }
//    }    
//  private func doSomething() {
//
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dd-MM-yyyy"
//
//    let request = EventsTab.Something.Request(
//        startdate: "\(formatter.string(from: datePicker.date))",
//        enddate: "\(formatter.string(from: Calendar.current.date(byAdding: .day, value: 0, to: datePicker.date)!))"
//    )
//    interactor?.doSomething(request: request)
//  }


  func displaySomething(viewModel: EventsTab.Something.ViewModel ) {
    displayedEvents = viewModel.displayedEvents
    displayedProfiles = viewModel.displayedProfiles
    displayedStatuses = viewModel.displayedStatuses

    if viewModel.error != nil {
        
        
    let alert = UIAlertController(title: "Alert", message: "\(viewModel.error!)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: { action in
            self.doSomething()
        }))
    self.present(alert, animated: true)
    }

    self.v.collectionView.reloadData()
    self.v.refreshControl.endRefreshing()
  }
}

extension EventsTabViewController {
    
    // Get YesplanEvents
    private func doSomething() {
      // Check Network
//    self.networkCheck = NetworkCheck.sharedInstance()
//      if networkCheck.currentStatus == .satisfied{
          let formatter = DateFormatter()
          formatter.dateFormat = "dd-MM-yyyy"
          
          let request = EventsTab.Something.Request(
              startdate: "\(formatter.string(from: datePicker.date))",
              enddate: "\(formatter.string(from: Calendar.current.date(byAdding: .day, value: 0, to: datePicker.date)!))"
          )
          interactor?.doSomething(request: request)
//      } else {
//          popupAlert(title: "Warning", message: "The Internet is not available", actionTitles: ["Dismiss", "Retry Connection"], actions: [nil, {action2 in
//            self.networkCheck.removeObserver(observer: self)
//            self.doSomething()}])
//
//      }
//      networkCheck.addObserver(observer: self)
//      let formatter = DateFormatter()
//      formatter.dateFormat = "dd-MM-yyyy"
//
//      let request = EventsTab.Something.Request(
//          startdate: "\(formatter.string(from: datePicker.date))",
//          enddate: "\(formatter.string(from: Calendar.current.date(byAdding: .day, value: 0, to: datePicker.date)!))"
//      )
//      interactor?.doSomething(request: request)
    }
    

}
