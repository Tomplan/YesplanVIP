//
//  CollectionViewModel.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

//protocol CollectionViewModelDelegate: class {
//    func didSelect(resourcebooking: Resourcebooking)
//}

class CollectionViewModel: CollectionViewViewModel<MultiCell, CollectionViewSource> {

    override func config(cell: MultiCell, data: CollectionViewSource, indexPath: IndexPath, grid: Grid) {
        cell.source = data
    }
    
//    override func size(data: CollectionViewSource, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return grid.size(for: view, height: 48)
//    }
    
    // set size off collectionview here
    override func size(data: CollectionViewSource, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        if grid.columns == 1 {
            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 1)
        }
        if
            (view.traitCollection.userInterfaceIdiom == .phone &&
                view.traitCollection.verticalSizeClass == .compact) ||
                view.traitCollection.userInterfaceIdiom == .pad
        {
            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 1)
        }
        return grid.size(for: view, ratio: 1.2, items: 1, gaps: 1)
    }
}
