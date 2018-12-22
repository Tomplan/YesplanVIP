//
//  EDTeamViewController.swift
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

protocol EDTeamDisplayLogic: class
{
    func displaySomething(viewModel: EDTeam.Something.ViewModel)
}

class EDTeamViewController: CollectionViewController, EDTeamDisplayLogic // UIViewController
{
    var interactor: EDTeamBusinessLogic?
    var router: (NSObjectProtocol & EDTeamRoutingLogic & EDTeamDataPassing)?
//    var v = EDTeamView()
    var sections: [EDTeam.Something.ViewModel.Section] = [EDTeam.Something.ViewModel.Section]()
    // MARK: Object lifecycle
//    var resourcebooking = Resourcebooking()
    
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
        let interactor = EDTeamInteractor()
        let presenter = EDTeamPresenter()
        let router = EDTeamRouter()
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
//    override func loadView() { view = v }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
//        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        v.collectionView.dataSource = self
//        v.collectionView.delegate = self
    }
    
    @objc private func refresh() {
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = EDTeam.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: EDTeam.Something.ViewModel)
    {
        
        sections = viewModel.sections
 
        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))

        let mysections = sections.compactMap { section -> CollectionViewSection in
            let items = section.rows.compactMap { resourcebooking -> CollectionViewViewModelProtocol in
                resourcebooking.resourcebooking.unfold()
//                switch resourcebooking.resourcebooking {
//                case .bulkResourceUse(let x):
//                print("bulk:", x.resource.name)
//                    let item = EDTeamViewModel(resourcebooking.resourcebooking)
//                    return item
//                case .freeFormResourceUse(let x):
//                    print("free:", x.resource.name)
//                    let item = EDTeamViewModel(resourcebooking.resourcebooking)
//                    return item
//                case .instantiableResourceUse(let x):
//                    print("nst:", x.resource.name)
//                    let item = EDTeamViewModel(resourcebooking.resourcebooking)
//                    return item
//                case .instantiableResourceUseGroup(let x):
//                    print("group:", x.resource.name)
//
//                    let item = EDTeamViewModel(resourcebooking.resourcebooking)
//                    return item
//                case .resourceSetUse(let x):
//                    print("set:", x.resource.name)
//
//                    let multiheader = MultiHeaderViewModel(x.resource.name)
//                    let items = x.children.map { resourcebooking -> CollectionViewViewModelProtocol in
//                        resourcebooking.unfold()
//                        switch resourcebooking {
//                        case .bulkResourceUse(let x):
//                            print("bulk2:", x.resource.name)
//                            let item = EDTeamViewModel(resourcebooking)
//                            return item
//                        case .freeFormResourceUse(let x):
//                            print("free2:", x.resource.name)
//                            let item = EDTeamViewModel(resourcebooking)
//                            return item
//                        case .instantiableResourceUse(let x):
//                            print("inst2:", x.resource.name)
//                            let item = EDTeamViewModel(resourcebooking)
//                            return item
//                        case .instantiableResourceUseGroup(let x):
//                            print("group2:", x.resource.name)
//                            let item = EDTeamViewModel(resourcebooking)
//                            return item
//                        case .resourceSetUse(let x):
//                            print("set2:", x.resource.name)
//
////                            let items = x.children.compactMap { resourcebooking in
////                            let section =  EDTeamViewModel(items: items)
////                            let k = CollectionViewSource(grid: grid, sections: [section])
////                            let l = CollectionViewModel(k)
////                            return l
//                            let item = EDTeamViewModel(resourcebooking)
//                            return item
//                        }
//
//                    }
//                    let section =  CollectionViewSection(header: multiheader, items: items)
//                    let k = CollectionViewSource(grid: grid, sections: [section])
//                    let l = CollectionViewModel(k)
//                    return l
//                    CollectionViewSource(grid: grid, sections: ikke)
                    
//                    let item = CollectionViewModel(resourcebooking.resourcebooking)
//                }
            }
            let header = HeaderViewModel(section.header)
            print("h:", header.data)
            let section =  CollectionViewSection(header: header, items: items)
            
            return section
        }
        self.source  = CollectionViewSource(grid: grid, sections: mysections)
        self.collectionView.reloadData()
    }
}
        
        
//        for section in sections {
//
////            let items = section.rows.compactMap { row -> EDTeamViewModel in
////                let viewModel = EDTeamViewModel(row.resourcebooking)
////                //            viewModel.delegate = self
////                return viewModel
////            }
//            let items = section.rows.compactMap { row -> EDTeamViewModel in
//
//                switch row.resourcebooking {
//                case .bulkResourceUse(_):
//
//                    let viewModel = EDTeamViewModel(row.resourcebooking)
//                    //            viewModel.delegate = sel
//                    return viewModel
//                case .freeFormResourceUse(_):
//                    let viewModel = EDTeamViewModel(row.resourcebooking)
//                    //            viewModel.delegate = self
//                    return viewModel
//                case .instantiableResourceUse(_):
//                    let viewModel = EDTeamViewModel(row.resourcebooking)
//                    //            viewModel.delegate = self
//                    return viewModel
//                case .instantiableResourceUseGroup(let x):
//                    let viewModel = EDTeamViewModel(row.resourcebooking)
//                    //            viewModel.delegate = self
//                    return viewModel
//                case .resourceSetUse(let x):
//                    let viewModel = EDTeamViewModel(row.resourcebooking)
//
////                    let items = x.children.map { resourcebooking -> EDTeamViewModel in
////                        let viewModel = EDTeamViewModel(resourcebooking)
//////                        viewModel.delegate = self
////                        return viewModel
////                    }
////
////                    let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8))
////                    let section = CollectionViewSection(items: items)
////                    let source  = CollectionViewSource(grid: grid, sections: [section])
////                    let sections = row
////                    let viewModel = EDTeamViewModel(CollectionViewSource(grid: grid, sections: [section]))
//                    //            viewModel.delegate = self
//
//                    return viewModel
//                }
//            }
        
//        let edTeamSection =  CollectionViewSection(items: items)
//        edTeamSection.header = HeaderViewModel(section.header)
//
//            mysections.append(edTeamSection)
//        }
//
//        self.source  = CollectionViewSource(grid: grid, sections: mysections)
//        self.collectionView.reloadData()
////    }
//////        sections = viewModel.sections
////        self.v.collectionView.reloadData()
//        self.v.refreshControl.endRefreshing()
//    }

//    func createHorizontal(viewModel: EDTeam.Something.ViewModel) -> CollectionViewModel {
//        var resourcebookings = [Resourcebooking]()
////        resourcebookings = viewModel.sections
//
//        let items = resourcebookings.map { resourcebooking -> HorizontalEDTeamViewModel in
//            let viewModel = HorizontalEDTeamViewModel(resourcebooking)
////            viewModel.delegate = self
//            return viewModel
//        }
//
//        let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8))
//        let section = CollectionViewSection(items: items)
//        let source  = CollectionViewSource(grid: grid, sections: [section])
//
//        return CollectionViewModel(source)
//    }
//}
//extension EDTeamViewController: EDTeamViewModelDelegate {
//
//    func didSelect(resourcebooking: Resourcebooking) {
//        let viewController = EDTeamViewController(nibName: nil, bundle: nil)
//        viewController.resourcebooking = resourcebooking
//        self.show(viewController, sender: nil)
//    }
//}
//
//
////extension ViewController: AlbumViewModelDelegate {
////
////    func didSelect(album: Album) {
////        let viewController = AlbumViewController(nibName: nil, bundle: nil)
////        viewController.album = album
////        self.show(viewController, sender: nil)
////    }
////}
