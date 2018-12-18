//
//  EDTeamViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//
//
//import UIKit
//import Stevia
//
//class EDTeamViewCell: CollectionViewCell {
//
//    // MARK: Properties
//
//    var lblName = UILabel()
//    var lblTime = UILabel()
//
//    lazy var width: NSLayoutConstraint = {
//        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
//        width.isActive = true
//        return width
//    }()
//
//        // MARK: Initialize Cell
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            contentView.translatesAutoresizingMaskIntoConstraints = false
//            setupComponents()
//            setupConstraints()
//        }
//
//        required init?(coder aDecoder: NSCoder)
//        {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        override func awakeFromNib() {
//            super.awakeFromNib()
//
//            fatalError("Interface Builder is not supported!")
//        }
//
//        override func prepareForReuse() {
//            super.prepareForReuse()
//
//            lblName.text = nil
//            lblTime.text = nil
//
//
//        }
//
//        // Mark: Auto-sizing Cell
//
//
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
//    }
//
//    // MARK: Private methods
//
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
//            lblName
//            ,lblTime
//        )
//
//        lblName.numberOfLines = 0
//        lblName.font = UIFont.systemFont(ofSize: 15.0)
//        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
//
//        lblTime.numberOfLines = 0
//        lblTime.font = UIFont.systemFont(ofSize: 12.0)
//        lblTime.textColor = UIColor(r: 64, g: 64, b: 64)
//
//    }
//
//    private func setupConstraints() {
//        layout(
//            4
//            ,|-16-lblName-16-|
//            ,|-16-lblTime-16-|
//            ,4
//        )
//    }
//}



//
//  EDTeamViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

class EDTeamViewCell: CollectionViewCell {

    // MARK: Properties

    var lblName = UILabel()
    var lblTime = UILabel()

    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()

    // MARK: Initialize Cell

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        fatalError("Interface Builder is not supported!")
    }

    override func reset() {
        super.reset()
        
        lblName.text = nil
        lblTime.text = nil
        
        
    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        lblName.text = nil
//        lblTime.text = nil
//
//
//    }

    // Mark: Auto-sizing Cell

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }

    // MARK: Private methods

    private func setupComponents() {

        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 4
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
        backgroundColor = UIColor(r: 158, g: 158, b: 158)

        sv(
            lblName
            ,lblTime
        )

        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
        lblName.textColor = UIColor(r: 64, g: 64, b: 64)

        lblTime.numberOfLines = 0
        lblTime.font = UIFont.systemFont(ofSize: 12.0)
        lblTime.textColor = UIColor(r: 64, g: 64, b: 64)

    }

    private func setupConstraints() {
        layout(
            4
            ,|-16-lblName-16-|
            ,|-16-lblTime-16-|
            ,4
        )
    }
}
