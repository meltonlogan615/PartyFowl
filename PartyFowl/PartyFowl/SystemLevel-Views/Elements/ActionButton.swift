//
//  ActionButton.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class ActionButton: UIButton {

  var title: String!

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  convenience init(titled title: String) {
    self.init()
    layer.cornerRadius = 12
    clipsToBounds = true
    self.title = title
    var config = UIButton.Configuration.plain()
    config.attributedTitle = AttributedString(title)
    config.baseForegroundColor = .white
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .systemFont(ofSize: 17, weight: .bold)
      return outgoing
    }
    configuration = config
    backgroundColor = K.brandRed
    heightAnchor.constraint(equalToConstant: 58).isActive = true
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
