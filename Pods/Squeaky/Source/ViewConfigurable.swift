//
//  ViewConfigurable.swift
//  AJ Self
//
//  Created by AJ Self on 8/21/17.
//  Copyright © 2017 AJ Self. All rights reserved.
//

import UIKit

public protocol ViewConfigurable: class {
  func setupViewHierarchy()
  func setupViews()
  func setupConstraints()
}

public extension ViewConfigurable {
  public func setupViewConfiguration() {
    setupViewHierarchy()
    setupViews()
    setupConstraints()
  }
}
