//
//  EDSchedulesViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension EDSchedulesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return  sections[section].header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let item = sections[section].rows {
            if item.entries.count == 0 {
                return 0
            } else
            {
                return item.entries.count
            }
        }
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDSchedulesViewCell", for: indexPath) as? EDSchedulesViewCell {
            
//            if let item = sections[section].rows {
//                if item.isEmpty {
//                    return 0
//                } else
//                {
//                    return item[0].entries.count
//                }
//            }
//            cell.lblName.text = "nametext"
            if sections.count != 0 {
                if let item = sections[indexPath.section].rows {
                    print(item.entries[indexPath.item])
            cell.populate(with: item, scheduleEntry: item.entries[indexPath.item])

                }
            }
        
//                let item = sections[indexPath.section].rows[indexPath.section]
//                cell.populate(with: item, scheduleEntry: item.entries[indexPath.item])
            
                
//                let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
//                item.configure(cell: cell)
                
//                if let redDot = sections[indexPath.section].rows[indexPath.section].defaultstartidx {
//                    print("redDot: ", redDot)
//                    for i in 0 ..< sections[indexPath.section].rows[indexPath.section].entries.count {
//                    let rowIndex = i + 1
//                        if rowIndex == redDot {
//                            print("rood bolleke")
////                            cell.lblStarttime.textColor = UIColor(r: 238, g: 0, b: 0)
//                        }
//                        else {
//                            print("")
//                        }
//                    }
//                }
//                if let redDot = sections[indexPath.section].rows[indexPath.section].defaultstopidx {
//                    print("redDot: ", redDot)
//                    for i in 0 ..< sections[indexPath.section].rows[indexPath.section].entries.count {
//                        let rowIndex = i + 1
//                        if rowIndex == redDot {
//                            print("rood bolleke")
////                            cell.lblStarttime.textColor = UIColor(r: 238, g: 0, b: 0)
//                        }
//                        else {
//                            print("grijs bolleke")
//                        }
//                    }
//                }
//            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"EDSchedulesViewHeader", for: indexPath) as! EDSchedulesViewHeader
            
            headerView.EDSchedulesViewHeaderLabel.text = sections[indexPath.section].header
            
            headerView.backgroundColor = UIColor.darkGray
            headerView.layer.backgroundColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.borderColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.masksToBounds = true
            headerView.layer.cornerRadius = 5
            headerView.layer.borderWidth = 4
            headerView.layer.shadowOffset = CGSize(width: -2, height: 2)
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let model = displayedEvents[indexPath.section].rows[indexPath.item]
        //        print("model: ", model)
        //        router?.routeToSomewhere(id: nil)
        //        router.showProduct(for: model.id)
    }
}
