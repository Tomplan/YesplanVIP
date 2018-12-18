////
////  EDTeamViewController+Extensions.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 11/11/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//import UIKit
//
//extension EDTeamViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return  sections.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
//        return  sections[section].header
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        if let team = sections[section].rows {
////            if locations.count != 0 {
////                return locations.count
////            } else { return 0 }
////        } else { return 0 }
////        print(sections[section].rows.count)
//        return sections[section].rows.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            if sections.count != 0 {
//                let item = sections[indexPath.section].rows[indexPath.row].resourcebooking
//                //                print("$:", item)
//                //                cell.populate(with: item)
//                switch item {
//                case .bulkResourceUse(let x):
//                     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDTeamViewCell", for: indexPath) as! EDTeamViewCell
//                     cell.populate(with: item)
//                     return cell
//                case .freeFormResourceUse(let x):
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDTeamViewCell", for: indexPath) as! EDTeamViewCell
//                    cell.populate(with: item)
//                    return cell
//                case .instantiableResourceUse(let x):
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDTeamViewCell", for: indexPath) as! EDTeamViewCell
//                    cell.populate(with: item)
//                        return cell
//                case .instantiableResourceUseGroup(let x):
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDTeamViewCell", for: indexPath) as! EDTeamViewCell
//                        cell.populate(with: item)
//                        return cell
//                case .resourceSetUse(let x):
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultiCell", for: indexPath) as! MultiCell
//                    
////                    cell.populate(with: item)
////                    cell.backgroundColor = UIColor.yellow
////                    cell.subView.collectionView.backgroundColor = UIColor.blue
////                    cell.lblName.text = "yep"
//                    return cell
////                    var subView = EDTeamView()
////                    subView.backgroundColor = UIColor.yellow
//                    //                    cell.addSubview(subView)
//                    //                    subView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//                    //                    subView.collectionView.dataSource = self
//                    //                    subView.collectionView.delegate = self
//                    //                    cell.populate(with: item)
//                }
//            }
//        
//        return UICollectionViewCell()
//    }
//    
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDTeamViewCell", for: indexPath) as? EDTeamViewCell {
////            if sections.count != 0 {
////                 let item = sections[indexPath.section].rows[indexPath.row].resourcebooking
//////                print("$:", item)
//////                cell.populate(with: item)
////                switch item {
////                case .bulkResourceUse(let x):
////                    cell.populate(with: item)
////                case .freeFormResourceUse(let x):
////                    cell.populate(with: item)
////                case .instantiableResourceUse(let x):
////                    cell.populate(with: item)
////                case .instantiableResourceUseGroup(let x):
////                    cell.populate(with: item)
////                case .resourceSetUse(let x):
////                    var subView = EDTeamView()
////                    subView.backgroundColor = UIColor.yellow
//////                    cell.addSubview(subView)
//////                    subView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//////                    subView.collectionView.dataSource = self
//////                    subView.collectionView.delegate = self
//////                    cell.populate(with: item)
////                }
////            }
////            return cell
////        }
////        return UICollectionViewCell()
////    }
////
//    
//    // Header
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind{
//        case UICollectionView.elementKindSectionHeader:
//            
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"EDTeamViewHeader", for: indexPath) as! EDTeamViewHeader
//            
//            headerView.EDTeamViewHeaderLabel.text = sections[indexPath.section].header
//            
//            headerView.backgroundColor = UIColor.darkGray
//            headerView.layer.backgroundColor = UIColor(r: 90, g: 90, b: 90).cgColor
//            headerView.layer.borderColor = UIColor(r: 90, g: 90, b: 90).cgColor
//            headerView.layer.masksToBounds = true
//            headerView.layer.cornerRadius = 5
//            headerView.layer.borderWidth = 4
//            headerView.layer.shadowOffset = CGSize(width: -2, height: 2)
//            return headerView
//            
//        default:
//            print("default")
//            fatalError("Unexpected element kind")
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //        let model = displayedEvents[indexPath.section].rows[indexPath.item]
//        //        print("model: ", model)
//        //        router?.routeToSomewhere(id: nil)
//        //        router.showProduct(for: model.id)
//    }
//}
