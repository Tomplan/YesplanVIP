//
//  CollectionViewModel.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class CollectionViewModel: CollectionViewViewModel<MultiCell, CollectionViewSource> {

//    override func config(cell: CollectionCell, data: CollectionViewSource, indexPath: IndexPath, grid: Grid) {
//        cell.source = data
//    }
    override func config(cell: MultiCell, data: CollectionViewSource, indexPath: IndexPath, grid: Grid) {
        
       
        
        
        cell.source = data
        
        
        
    }
//    override func size(data: CollectionViewSource, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        return grid.size(for: view, height: 200, items: grid.columns)
//    }
    
    override func size(data: CollectionViewSource, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
        // note: this is a "complex" displaying the same cell in multiple grids, never done this like before haha
        if grid.columns == 1 {
//            return grid.size(for: view, ratio: 1)
            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 0)

        }
        if
            (view.traitCollection.userInterfaceIdiom == .phone &&
                view.traitCollection.verticalSizeClass == .compact) ||
                view.traitCollection.userInterfaceIdiom == .pad
        {
            return grid.size(for: view, ratio: 1.2, items: 1, gaps: 3)
        }
        return grid.size(for: view, ratio: 1.2, items: 2, gaps: 1)
    }
    
//    override func size(data: CollectionViewSource, indexPath: IndexPath, grid: Grid, view: UIView) -> CGSize {
//        // note: cell has 8pt paddings on every side, that's why the +-16...
//        let width = grid.width(for: view) - 16
//        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
//        let height = UILabel.height(forWidth: width - 16, font: font, text: data.collectionView(<#T##collectionView: UICollectionView##UICollectionView#>, numberOfItemsInSection: <#T##Int#>))
//        return CGSize(width: width, height: height + 16)
//    }
}
