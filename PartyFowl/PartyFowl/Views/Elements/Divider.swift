//
//  Divider.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class Divider: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
    backgroundColor = .blue
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
