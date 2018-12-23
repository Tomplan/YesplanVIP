//
//  HeaderCell.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit
import Stevia

class MultiHeaderCell: CollectionViewCell {
    
//    @IBOutlet weak var textLabel: UILabel!
    
    var lblTitle = UILabel()

    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
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
        
        lblTitle.text = nil
        
        
    }
    
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
            lblTitle
        )
        
        lblTitle.numberOfLines = 0
        lblTitle.font = UIFont.systemFont(ofSize: 15.0)
        lblTitle.textColor = UIColor(r: 64, g: 64, b: 64)
        
        
    }
    
    private func setupConstraints() {
        layout(
            4
            ,|-16-lblTitle-16-|
            ,4
        )
    }

}
