//
//  OptionsCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/26/23.
//

import UIKit

class ItemContainerCell: UITableViewCell {
  static let reuseID = "optionCell"
  var titleLabel: UILabel!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: ItemContainerCell.reuseID)
    styleCell()
    layoutCell()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ItemContainerCell {
  private func styleCell() {
    titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .preferredFont(forTextStyle: .headline)
    titleLabel.textColor = K.brandRed
  }

  private func layoutCell() {
    contentView.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1)
    ])
  }
}
