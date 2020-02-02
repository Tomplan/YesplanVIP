////
////  EDAttachmentsViewModel.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 15/12/2018.
////  Copyright © 2018 Yesplan. All rights reserved.
////

import UIKit

//
//protocol EDAttachmentsViewModelDelegate: class {
//    func didSelect(eventAttachment: EventAttachment)
//}

class EDAttachmentsViewModel: CollectionViewViewModel<EDAttachmentsViewCell, EventAttachment> {
    
//    weak var delegate: EDAttachmentsViewModelDelegate?

    override func config(cell: EDAttachmentsViewCell , data: EventAttachment, indexPath: IndexPath, grid: Grid) {
        
//        switch data {
//        case .eventDocumentAttachment(let x):
//
//            print("hierse:", x.dataurl)
//            if let name = x.originalName {
//                cell.lblName.text = name }
// 
//            if let date = x.date {
//                cell.lblDate.text = date.convertDateString(dateFormat: "HH:mm") }
//
//            if let username = x.username {
//                cell.lblUsername.text = username }
//            
//        case .eventlinkAttachment(let x):
//            
//            print("hierookse:", x.dataurl)
//             let name = x.dataurl
//             cell.lblName.text = name.absoluteString
//            
//            if let date = x.date {
//                cell.lblDate.text = date.convertDateString(dateFormat: "HH:mm") }
//
//            if let username = x.username {
//                cell.lblUsername.text = username }
//                       
//        }
        
    }
    
    override func size(data: EventAttachment, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        print(grid.)
        return grid.size(for: view, height: 1 ) //grid.height(for: view) )
    }
    
//    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return .zero
//    } // NOT GOOD

    
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
    
//    override func callback(data: Resourcebooking, indexPath: IndexPath) {
//        self.delegate?.didSelect(resourcebooking: data)
//    }
}

//class HorizontalEDAttachmentsViewModel: EDAttachmentsViewModel {
//
//    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return CGSize(width: 140, height: 40)
//    }
//}

