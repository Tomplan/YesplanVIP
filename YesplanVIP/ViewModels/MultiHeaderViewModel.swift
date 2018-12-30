//
//  MultiHeaderViewModel.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 21/12/2018.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class MultiHeaderViewModel: CollectionViewViewModel<MultiHeaderCell, String> {
    
    override func config(cell:MultiHeaderCell , data: String, indexPath: IndexPath, grid: Grid) {
        cell.lblTitle.text = data
    }
    
//    override func size(data: Resourcebooking, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        //        print(grid.)
//        return grid.size(for: view, height: 1 ) //grid.height(for: view) )
//    }
    override func size(data: String, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        return grid.size(for: view, height: 35)
    }
    
//    override func size(data: String, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return grid.size(for: view, height: 20)
//    }
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 20))
//    }

}
