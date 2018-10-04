//
//  TasksTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 2/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension TasksViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayedTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return displayedTasks[section].date
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if displayedTasks[section].tasks.count != 0 {

            return displayedTasks[section].tasks.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TasksTabViewCell", for: indexPath) as? TasksTabViewCell {
            if displayedTasks.count != 0 {
                let task = displayedTasks[indexPath.section].tasks[indexPath.item]
                cell.populate(with: task)
                
            }
            return cell
        }
        return UICollectionViewCell()
    }
  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"TasksTabViewHeader", for: indexPath) as! TasksTabViewHeader
            if displayedTasks[indexPath.section].date != "no deadline" {
            headerView.TasksViewHeaderLabel.text = displayedTasks[indexPath.section].date.convertDateStringShort(dateFormat: "EEEE, dd MMMM yyyy")
            } else {
            headerView.TasksViewHeaderLabel.text = "no deadline"
            }
            headerView.backgroundColor = UIColor.darkGray  // ... YELLOW background
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
        }
    }
}
