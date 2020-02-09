//
//  EventsDetailViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension ToDosDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  displayedToDos.count
    }

    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return "section" // displayedEvents[section].date
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if displayedToDos[section].rows.count != 0 {
            return displayedToDos[section].rows.count
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToDosDetailViewCell", for: indexPath) as? ToDosDetailViewCell {
            
            if displayedToDos.count != 0 {
                let toDo = displayedToDos[indexPath.section].rows[indexPath.item]
                cell.populate(with: toDo)
                
                cell.isSelected = false
                collectionView.deselectItem(at: indexPath, animated: true)
            }
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"ToDosDetailViewHeader", for: indexPath) as! ToDosDetailViewHeader

            headerView.ToDosDetailViewHeaderLabel.text =  displayedToDos[indexPath.section].header

            headerView.backgroundColor = UIColor.darkGray
            headerView.layer.backgroundColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.borderColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.masksToBounds = true
            headerView.layer.cornerRadius = 5
            headerView.layer.borderWidth = 4
            headerView.layer.shadowOffset = CGSize(width: -2, height: 2)
            return headerView

        default:
//            print("default")
            fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = displayedToDos[indexPath.section].rows[indexPath.item]
        router?.routeToSomewhere(row: row)
    }
}
