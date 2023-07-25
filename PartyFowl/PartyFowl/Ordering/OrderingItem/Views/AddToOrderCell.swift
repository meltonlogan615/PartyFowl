//
//  AddToOrderCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/5/23.
//

import UIKit

class AddToOrderCell: UITableViewCell {
  static let reuseID = "AddToOrderCell"
  var button: UIButton!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: AddToOrderCell.reuseID)
    print("in use")
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AddToOrderCell {
  private func styleCell() {
    button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    var config = UIButton.Configuration.plain()
    config.title = "Add To Order"
    config.baseBackgroundColor = .systemBackground
    config.baseForegroundColor = K.brandRed
    config.buttonSize = .large
    button.configuration = config

    contentView.addSubview(button)
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: contentView.topAnchor),
      button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}
