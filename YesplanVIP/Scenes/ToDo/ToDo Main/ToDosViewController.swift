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
import SwipeCellKit

protocol ToDosDisplayLogic: class
{
    func displaySomething(viewModel: ToDosTab.Something.ViewModel)
}

class ToDosViewController: UIViewController, UICollectionViewDelegateFlowLayout, ToDosDisplayLogic
{
    private let notificationPublisher = NotificationPublisher()
    
    var defaultOptions = SwipeOptions()
    var isSwipeRightEnabled = true
    var buttonDisplayMode: ButtonDisplayMode = .titleAndImage
    var buttonStyle: ButtonStyle = .backgroundColor
    var usesTallCells = false
    
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
        
        
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
        
//        center.getPendingNotificationRequests(completionHandler: { requests in
//            print("*requests*")
//            for request in requests {
//                print("(request:", request)
//            }
//        })
        
        
        for toDos in displayedToDos {
            for toDo in toDos.toDos {

                if let myDate = toDo.due {

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                let date = dateFormatter.date(from:myDate)!
                let calendar = Calendar.current
                // first notification
                    var notificationDate = calendar.date(byAdding: .hour, value: -1, to: date)!
//                    print("notificationDate:", notificationDate)
                    var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
                    notificationPublisher.sendNotification(title: toDo.name ?? "name", subtitle: "due: \(toDo.due?.convertDateString(dateFormat: "EEEE, dd MM yyyy") ?? "")", body: toDo.description ?? "description", badge: 1, delayInterval: nil, date: components, id: "1 \(toDo.id)")

                    // second notification
                    notificationDate = calendar.date(byAdding: .day, value: -1, to: date)!
//                    print("notificationDate:", notificationDate)
                    components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
                    notificationPublisher.sendNotification(title: toDo.name ?? "name", subtitle: "due: \(toDo.due?.convertDateString(dateFormat: "EEEE, dd MM yyyy") ?? "")", body: toDo.description ?? "description", badge: 1, delayInterval: nil, date: components, id: "2 \(toDo.id)")
                }
            }
        }
        
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



extension ToDosViewController: SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToSomewhere(segue: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        print("action")
        let toDo = displayedToDos[indexPath.row]
        
        if orientation == .left {
            guard isSwipeRightEnabled else { return nil }
            print("swipe right")
            print(toDo.date)
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
            print("flag")
            
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

            let cell = collectionView.cellForItem(at: indexPath) as! ToDosTabViewCell
            
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
}
//
//class MailCollectionViewCell: SwipeCollectionViewCell {
//    @IBOutlet var fromLabel: UILabel!
//    @IBOutlet var dateLabel: UILabel!
//    @IBOutlet var subjectLabel: UILabel!
//    @IBOutlet var bodyLabel: UILabel!
//
//    var animator: Any?
//
//    var indicatorView = IndicatorView(frame: .zero)
//
//    var unread = false {
//        didSet {
//            indicatorView.transform = unread ? CGAffineTransform.identity : CGAffineTransform.init(scaleX: 0.001, y: 0.001)
//        }
//    }
//
//    override func awakeFromNib() {
//        setupIndicatorView()
//    }
//
//    func setupIndicatorView() {
//        indicatorView.translatesAutoresizingMaskIntoConstraints = false
//        indicatorView.color = tintColor
//        indicatorView.backgroundColor = .clear
//        contentView.addSubview(indicatorView)
//
//        let size: CGFloat = 12
//        indicatorView.widthAnchor.constraint(equalToConstant: size).isActive = true
//        indicatorView.heightAnchor.constraint(equalTo: indicatorView.widthAnchor).isActive = true
//        indicatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
//        indicatorView.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor).isActive = true
//    }
//
//    func setUnread(_ unread: Bool, animated: Bool) {
//        let closure = {
//            self.unread = unread
//        }
//
//        if #available(iOS 10, *), animated {
//            var localAnimator = self.animator as? UIViewPropertyAnimator
//            localAnimator?.stopAnimation(true)
//
//            localAnimator = unread ? UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.4) : UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1.0)
//            localAnimator?.addAnimations(closure)
//            localAnimator?.startAnimation()
//
//            self.animator = localAnimator
//        } else {
//            closure()
//        }
//    }
//}
