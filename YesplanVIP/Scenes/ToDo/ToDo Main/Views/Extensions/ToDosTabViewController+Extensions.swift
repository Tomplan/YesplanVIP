//
//  ToDosTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 2/10/18.
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToDosTabViewCell", for: indexPath) as? ToDosTabViewCell {
            if displayedToDos.count != 0 {
                let toDo = displayedToDos[indexPath.section].toDos[indexPath.item]
                cell.populate(with: toDo)
            }
            return cell
        }
        return UICollectionViewCell()
    }
  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
            case UICollectionView.elementKindSectionHeader:
                
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"ToDosTabViewHeader", for: indexPath) as! ToDosTabViewHeader
                if displayedToDos[indexPath.section].date != "no deadline" {
                headerView.ToDosViewHeaderLabel.text = displayedToDos[indexPath.section].date.convertDateStringShort(dateFormat: "EEEE, dd MMMM yyyy")
                } else {
                headerView.ToDosViewHeaderLabel.text = "no deadline"
                }
                
                headerView.backgroundColor = UIColor.darkGray
                headerView.layer.backgroundColor = UIColor(r: 90, g: 90, b: 90).cgColor
                headerView.layer.borderColor = UIColor(r: 90, g: 90, b: 90).cgColor
                headerView.layer.masksToBounds = true
                headerView.layer.cornerRadius = 5
                headerView.layer.borderWidth = 4
                headerView.layer.shadowOffset = CGSize(width: -2, height: 2)
                return headerView
                
            default:
                fatalError("Unexpected element kind")
            }
        }
    

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("extension col")
            router?.routeToSomewhere(segue: nil)
        }
}
