//
//  ToDosTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension ToDosViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayedToDos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return displayedToDos[section].date
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if displayedToDos[section].toDos.count != 0 {
            
            return displayedToDos[section].toDos.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("func collectionView")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToDosTabViewCell", for: indexPath) as? ToDosTabViewCell {
            if displayedToDos.count != 0 {
                let task = displayedToDos[indexPath.section].toDos[indexPath.item]
                cell.populate(with: task)
                
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: collectionView.frame.size.width, height: 200)
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        print("eeeee")
    //        let cellsAcross: CGFloat = 3
    //        var widthRemainingForCellContent = collectionView.bounds.width
    //        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
    //            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
    //            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
    //        }
    //        let cellWidth = widthRemainingForCellContent / cellsAcross
    //        return CGSize(width: cellWidth, height: cellWidth)
    //    }
    
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //        let screenSize = UIScreen.main.bounds
    //        let screenWidth = screenSize.width
    //        let cellHeight: CGFloat = 200
    //        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
    //        return size;
    //    }
    //    func collectionView(_ collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
    //    }
    //    func collectionView(_ collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 8
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                        insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    //    }
    //    if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
    //        layout.sectionHeadersPinToVisibleBounds = true
    //    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            print("elementKindSectionHeader")
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"ToDosTabViewHeader", for: indexPath) as! ToDosTabViewHeader
            
            //            let formatter = DateFormatter()
            //            formatter.timeZone = TimeZone.current
            //            formatter.dateFormat = "dd-MM-yyyy"
            //
            //                        let dateString = formatter.string(from: displayedToDos[indexPath.section].date)
            if displayedToDos[indexPath.section].date != "no deadline" {
                headerView.ToDosViewHeaderLabel.text = displayedToDos[indexPath.section].date.convertDateStringShort(dateFormat: "EEEE, dd MMMM yyyy")
            } else {
                headerView.ToDosViewHeaderLabel.text = "no deadline"
            }
            headerView.backgroundColor = UIColor.darkGray  // ... YELLOW background
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
            //                return fatalError("Unexpected element kind")
        }
    }
}
