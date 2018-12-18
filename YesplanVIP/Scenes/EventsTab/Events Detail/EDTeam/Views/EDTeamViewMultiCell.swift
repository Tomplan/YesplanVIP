//
//  EDTeamViewMultiCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/12/2018.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

import UIKit
import Stevia


class MultiCell: CollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var doctorList : Resourcebooking?{ //DoctorList gets set from ViewController Class from
        //cell.doctorList = doctorsList?[indexPath.item]
        didSet{
            if let doctorName = doctorList?.resource.name{ //Safely unwrap the value and set it to label
                doctorNameLabel.text = doctorName;
            }
        }
    }
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: .gray)
    
    lazy var collectionView : UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width

        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 40)

        collectionView.backgroundColor = UIColor.yellow // UIColor(r: 176, g: 176, b: 176)

        //        let cellHeight: CGFloat = 75
        //        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
        //        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width, height: 100)
        //        flowLayout.itemSize = size

        return collectionView
    }()
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        print("width:", width)
        return width
    }()
    
//    let cellId = "CellId"; // same as above unique id
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews();
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "EDTeamViewCell"); //register custom UICollectionViewCell class.
        // Here I am not using any custom class
        
    }
    
    
    func setupViews(){
        
        sv(collectionView)
        collectionView.fillContainer()
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        collectionView.register(EDTeamViewCell.self, forCellWithReuseIdentifier: "EDTeamViewCell")
        collectionView.register(EDTeamViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "EDTeamViewHeader")
        collectionView.register(MultiCell.self, forCellWithReuseIdentifier: "MultiCell")

//        addSubview(collectionView);
//
//        collectionView.delegate = self;
//        collectionView.dataSource = self;
//
//        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
//        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true;
//        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true;
//        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
    }
    
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout();
//        layout.scrollDirection = .vertical; //set scroll direction to horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
//        cv.backgroundColor = .blue; //testing
//        cv.translatesAutoresizingMaskIntoConstraints = false;
//        return cv;
//    }();
    // Mark: Auto-sizing Cell
    let doctorNameLabel: UILabel = { //Label to hold doctor name. See the screen shot
        let label = UILabel();
        label.text = "Doctor name";
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 18);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 100))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDTeamViewCell", for: indexPath);
        cell.backgroundColor = .red;
//        cell.popu
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height - 10);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
//class EDTeamViewMultiCell: UICollectionViewCell {
//
//    // MARK: Properties
//    lazy var width: NSLayoutConstraint = {
//        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
//        width.isActive = true
//        return width
//    }()
//    var subView = EDTeamView()
////    var lblName = UILabel()
////    var lblTime = UILabel()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        setupComponents()
//        setupConstraints()
//    }
//
//    required init?(coder aDecoder: NSCoder)
//    {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        fatalError("Interface Builder is not supported!")
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
////        lblName.text = nil
////        lblTime.text = nil
//
//
//    }
//
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
//    }
//
//    // MARK: Private methods
//    private func setupComponents() {
//
//        layer.masksToBounds = true
//        layer.cornerRadius = 5
//        layer.borderWidth = 4
//        layer.shadowOffset = CGSize(width: -2, height: 2)
//        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
//        backgroundColor = UIColor(r: 158, g: 158, b: 158)
//
//        sv(
////            lblName
////            ,lblTime
//        )
//
////        lblName.numberOfLines = 0
////        lblName.font = UIFont.systemFont(ofSize: 15.0)
////        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
//
//    }
//
//    private func setupConstraints() {
//
//        layout(
////            4
////            ,|-16-lblName-16-|
////            ,|-16-lblTime-16-|
////            ,4
//        )
//    }
//}
