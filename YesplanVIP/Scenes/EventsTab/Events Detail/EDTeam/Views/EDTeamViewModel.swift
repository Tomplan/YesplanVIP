////
////  EDTeamViewModel.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 15/12/2018.
////  Copyright © 2018 Yesplan. All rights reserved.
////

import UIKit


protocol EDTeamViewModelDelegate: class {
    func didSelect(resourcebooking: Resourcebooking)
}

class EDTeamViewModel: CollectionViewViewModel<EDTeamViewCell, Resourcebooking> {
    
    weak var delegate: EDTeamViewModelDelegate?

    override func config(cell: EDTeamViewCell , data: Resourcebooking, indexPath: IndexPath, grid: Grid) {
        
        switch data {
        case .bulkResourceUse(let x):
            var name = String()
            var start = String()
            var end = String()
            var role = String()
            
            name = x.resource.name
            cell.lblName.text = name
            
            start = x.start.convertDateString(dateFormat: "HH:mm")!
            end = x.end.convertDateString(dateFormat: "HH:mm")!
            
            cell.lblTime.text = "\(start) - \(end)"
        case .freeFormResourceUse(let x):
            var name = String()
            var start = String()
            var end = String()
            var role = String()

            name = x.resource.name
            cell.lblName.text = name
            
            start = x.start.convertDateString(dateFormat: "HH:mm")!
            end = x.end.convertDateString(dateFormat: "HH:mm")!
            
            cell.lblTime.text = "\(start) - \(end)"
        case .instantiableResourceUse(let x):
            var name = String()
            var start = String()
            var end = String()
            var role = String()

            name = x.resource.name
            cell.lblName.text = name
            
            start = x.start.convertDateString(dateFormat: "HH:mm")!
            end = x.end.convertDateString(dateFormat: "HH:mm")!
            
            cell.lblTime.text = "\(start) - \(end)"
            
            cell.lblRole.text = "iets"
            
        case .instantiableResourceUseGroup(let x):
            var name = String()
            var start = String()
            var end = String()
            var role = String()

            name = x.resource.name
            cell.lblName.text = name
            
            start = (x.children[0].start?.convertDateString(dateFormat: "HH:mm")!)!
            end = (x.children[0].end?.convertDateString(dateFormat: "HH:mm")!)!
            
            cell.lblTime.text = "\(start) - \(end)"
            
            cell.lblRole.text = "niets"

        case .resourceSetUse(let x):
            var name = String()
//            var start = String()
//            var end = String()
            
            name = x.resource.name
            cell.lblName.text = name
            
//            start = x.start
//            end = x.end
            
//            cell.lblTime.text = "\(start) - \(end)"
        }
        
    }
    
    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        return grid.size(for: view, height: 1)
    }
    
//    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return .zero
//    }

    
    //    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        // note: this is a "complex" displaying the same cell in multiple grids, never done this like before haha
//        if grid.columns == 1 {
//            //            return grid.size(for: view, ratio: 1)
//            return grid.size(for: view, ratio: 0.2, items: 1, gaps: 0)
//
//        }
//        if
//            (view.traitCollection.userInterfaceIdiom == .phone &&
//                view.traitCollection.verticalSizeClass == .compact) ||
//                view.traitCollection.userInterfaceIdiom == .pad
//        {
//            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 3)
//        }
//        return grid.size(for: view, ratio: 1.2, items: 2, gaps: 1)
//    }
//    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        // note: this is a "complex" displaying the same cell in multiple grids, never done this like before haha
//        if grid.columns == 1 {
//            return grid.size(for: view, ratio: 0.2)
//        }
//        if
//            (view.traitCollection.userInterfaceIdiom == .phone &&
//                view.traitCollection.verticalSizeClass == .compact) ||
//                view.traitCollection.userInterfaceIdiom == .pad
//        {
//            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 3)
//        }
//        return grid.size(for: view, ratio: 1.2, items: 2, gaps: 1)
//    }
    
    override func callback(data: Resourcebooking, indexPath: IndexPath) {
        self.delegate?.didSelect(resourcebooking: data)
    }
}

//class HorizontalEDTeamViewModel: EDTeamViewModel {
//
//    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return CGSize(width: 140, height: 40)
//    }
//}

