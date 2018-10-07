//
//  TeamplannerTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension TeamplannerTabViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayedResourcebookings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return displayedResourcebookings[section].date
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if displayedResourcebookings[section].resourcebookings.count != 0 {
            return displayedResourcebookings[section].resourcebookings.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamplannerTabViewCell", for: indexPath) as? TeamplannerTabViewCell {
            if displayedResourcebookings.count != 0 {
                let resourcebooking = displayedResourcebookings[indexPath.section].resourcebookings[indexPath.item]
                cell.populate(with: resourcebooking)
                
                
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"TeamplannerTabViewHeader", for: indexPath) as! TeamplannerTabViewHeader
            
            headerView.TeamplannerTabViewHeaderLabel.text = displayedResourcebookings[indexPath.section].date
            
            headerView.backgroundColor = UIColor.darkGray
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
        }
    }
}
