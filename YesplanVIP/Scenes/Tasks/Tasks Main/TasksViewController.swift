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
import SwipeCellKit
import EventKitUI

protocol TasksDisplayLogic: class
{
  func displaySomething(viewModel: TasksTab.Something.ViewModel)
}

class TasksViewController: UIViewController, UICollectionViewDelegateFlowLayout, TasksDisplayLogic
{
     var calendarEventStore = EKEventStore()
     var remindersEventStore = EKEventStore()
     var reminders: [EKReminder]!
 
    var defaultOptions = SwipeOptions()
    var isSwipeRightEnabled = true
    var buttonDisplayMode: ButtonDisplayMode = .titleAndImage
    var buttonStyle: ButtonStyle = .backgroundColor
    var usesTallCells = false
    
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
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    self.remindersEventStore.reset()
    self.remindersEventStore.requestAccess(to: EKEntityType.reminder, completion: {(granted, error) in if !granted {
        print("Access to store not granted")}
        })
        let predicate = self.remindersEventStore.predicateForReminders(in: nil)
    self.remindersEventStore.fetchReminders(matching: predicate, completion: { (reminders: [EKReminder]?) -> Void in
        self.reminders = reminders
        //            print(self.reminders as Any)
        DispatchQueue.main.async {
                            // code
                    }
                })
        
        getTasks()
        v.collectionView.dataSource = self
        v.collectionView.delegate = self 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func userDefaultsDidChange(){
        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        getTasks()
    }
    
    @objc func addTapped(sender: AnyObject) {
//        NotificationCenter.default.removeObserver(self)
        if let url = URL(string:UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                _ =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc private func refresh() {
        getTasks()
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
        }))
        self.present(alert, animated: true)
    }
    self.v.collectionView.reloadData()
    self.v.refreshControl.endRefreshing()
  }
}


extension TasksViewController: SwipeCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        print("action")
        let task = displayedTasks[indexPath.section].tasks[indexPath.row]
        
        if orientation == .left {
            guard isSwipeRightEnabled else { return nil }
            print("swipe right")
//            print(task.name ?? "")
//            let read = SwipeAction(style: .default, title: nil) { action, indexPath in
//                let updatedStatus = !email.unread
//                email.unread = updatedStatus
//
//                let cell = collectionView.cellForItem(at: indexPath) as! MailCollectionViewCell
//                cell.setUnread(updatedStatus, animated: true)
//            }
//
//            read.hidesWhenSelected = true
//            read.accessibilityLabel = email.unread ? "Mark as Read" : "Mark as Unread"
//
//            let descriptor: ActionDescriptor = email.unread ? .read : .unread
//            configure(action: read, with: descriptor)
//
//            return [read]
        } else {
            print("swipe left")

                let flag = SwipeAction(style: .default, title: nil) { action, indexPath in
                     
                    let reminder = EKReminder(eventStore: self.remindersEventStore)
                    let dateFormatter = ISO8601DateFormatter()
                    let calendar = Calendar.current
                    
                    print(task.name)
                    reminder.title = task.name ?? "TO DO"
                    
                    print(task.due)
                    let dueDate = dateFormatter.date(from:task.due ?? (String(describing: Date())))!
                    let dueComponents = calendar.dateComponents([.year, .month, .day, .hour], from: dueDate)
                    reminder.dueDateComponents = dueComponents
                    
                    print(task.description)
                    reminder.notes = task.description
                    
                    print(task.start)
                    if let startDate = dateFormatter.date(from:task.start ?? (String(describing: Date()))) {
                    let startComponents = calendar.dateComponents([.year, .month, .day, .hour], from: startDate)
                    reminder.startDateComponents = startComponents

                    print(task.url)
                    reminder.url = task.url
                    
                    let alarm = EKAlarm(absoluteDate: startDate)
                    reminder.addAlarm(alarm)
                    
                    let alarmMinusOneDay = EKAlarm(absoluteDate: dueDate.addingTimeInterval(-3600*24))
                    reminder.addAlarm(alarmMinusOneDay)
                    }
                    self.createReminder(reminder: reminder)

                        
            //          *****************************************************
                        // TODO Add user notification
            //          *****************************************************
                        }
                        flag.hidesWhenSelected = true
                        configure(action: flag, with: .flag)

                        let done = SwipeAction(style: .destructive, title: nil) { action, indexPath in
                            print("done")
            //                self.emails.remove(at: indexPath.row)
                            
            //              *****************************************************
                            // TODO: YESPLAN API PUT TASK STATUS TO DONE URL SEND
            //              *****************************************************

                        }
            configure(action: done, with: .trash)

                        let cell = collectionView.cellForItem(at: indexPath) as! TasksTabViewCell
                        
                        let closure: (UIAlertAction) -> Void = { _ in cell.hideSwipe(animated: true) }
                        
                        let more = SwipeAction(style: .default, title: nil) { action, indexPath in
                            let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                            controller.addAction(UIAlertAction(title: "New", style: .default, handler: closure))
                            controller.addAction(UIAlertAction(title: "Started", style: .default, handler: closure))
                            controller.addAction(UIAlertAction(title: "OnHold", style: .default, handler: closure))
                            controller.addAction(UIAlertAction(title: "Done", style: .default, handler: closure))
                            controller.addAction(UIAlertAction(title: "Obsolete", style: .default, handler: closure))
                            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: closure))
                            self.present(controller, animated: true, completion: nil)
                        }
                        configure(action: more, with: .more)

                        return [done, flag, more]
                    }
                    return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = orientation == .left ? .selection : .destructive
        options.transitionStyle = defaultOptions.transitionStyle
        
        switch buttonStyle {
        case .backgroundColor:
            options.buttonSpacing = 11
        case .circular:
            options.buttonSpacing = 4
        #if canImport(Combine)
            if #available(iOS 13.0, *) {
                options.backgroundColor = UIColor.systemGray6
            } else {
                options.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
            }
        #else
            options.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
        #endif
        }
        
        return options
    }
    
    func visibleRect(for collectionView: UICollectionView) -> CGRect? {
        if usesTallCells == false { return nil }
        
        if #available(iOS 11.0, *) {
            return collectionView.safeAreaLayoutGuide.layoutFrame
        } else {
            let topInset = navigationController?.navigationBar.frame.height ?? 0
            let bottomInset = navigationController?.toolbar?.frame.height ?? 0
            let bounds = collectionView.bounds
            
            return CGRect(x: bounds.origin.x, y: bounds.origin.y + topInset, width: bounds.width, height: bounds.height - bottomInset)
        }
    }
    
    func configure(action: SwipeAction, with descriptor: ActionDescriptor) {
        action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        action.image = descriptor.image(forStyle: buttonStyle, displayMode: buttonDisplayMode)
        
        switch buttonStyle {
        case .backgroundColor:
            action.backgroundColor = descriptor.color(forStyle: buttonStyle)
        case .circular:
            action.backgroundColor = .clear
            action.textColor = descriptor.color(forStyle: buttonStyle)
            action.font = .systemFont(ofSize: 13)
            action.transitionDelegate = ScaleTransition.default
        }
    }
    
     func createReminder(reminder: EKReminder) {
        
        reminder.calendar = remindersEventStore.defaultCalendarForNewReminders()

        do {
                try remindersEventStore.save(reminder, commit: true)
            } catch let error  {
                print("Reminder failed with error \(error.localizedDescription)")
                return
            }
            
            print(reminder.calendarItemIdentifier)
            let alertController = UIAlertController(title: "Reminder Created Successfully", message: "Open Reminders?", preferredStyle: .alert)
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                NSLog("OK Pressed")
                let url = URL(string: "x-apple-reminderkit:/\(reminder.calendarItemIdentifier)")
                UIApplication.shared.open(url!, options: [:]) { (finish) in }
                            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { UIAlertAction in
                NSLog("Cancelled")}
            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            // Present the controller
            self.present(alertController, animated: true, completion: nil)
            
        }
}
