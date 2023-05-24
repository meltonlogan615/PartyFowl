//
//  MenuItemCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/10/23.
//

import UIKit

class MenuItemCell: UITableViewCell {
  static var reuseID = "MenuItemCellReuseID"
  var itemNameLabel: UILabel!
  var descriptionLabel: UILabel!
  var priceLabel: UILabel!
  var additionalInfoLabel: UILabel!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: MenuItemCell.reuseID)
    styleMenuItem()
    layoutMenuItem()
  }

  override func prepareForReuse() {
    itemNameLabel.text = ""
    descriptionLabel.text = ""
    priceLabel.text = ""
    additionalInfoLabel.text = ""
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MenuItemCell {
  private func styleMenuItem() {
    itemNameLabel = UILabel()
    itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
    itemNameLabel.font = .preferredFont(forTextStyle: .headline)
    itemNameLabel.textColor = .label
    itemNameLabel.textAlignment = .center
    itemNameLabel.numberOfLines = 0

    descriptionLabel = UILabel()
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.font = .preferredFont(forTextStyle: .body)
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textColor = .label
    descriptionLabel.textAlignment = .center

    priceLabel = UILabel()
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    priceLabel.font = .preferredFont(forTextStyle: .body)
    priceLabel.textAlignment = .center

    additionalInfoLabel = UILabel()
    additionalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    additionalInfoLabel.textColor = K.brandRed
    additionalInfoLabel.font = .preferredFont(forTextStyle: .body)
    additionalInfoLabel.textAlignment = .center
    additionalInfoLabel.numberOfLines = 0
  }

  private func layoutMenuItem() {
    contentView.addSubview(itemNameLabel)
    NSLayoutConstraint.activate([
      itemNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
      itemNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: itemNameLabel.trailingAnchor, multiplier: 2)
    ])

    contentView.addSubview(descriptionLabel)
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 4),
      descriptionLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor)
    ])

    contentView.addSubview(priceLabel)
    NSLayoutConstraint.activate([
      priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
      priceLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor),
      priceLabel.trailingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor)
    ])

    contentView.addSubview(additionalInfoLabel)
    NSLayoutConstraint.activate([
      additionalInfoLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
      additionalInfoLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor),
      additionalInfoLabel.trailingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: additionalInfoLabel.bottomAnchor, multiplier: 1)
    ])
  }
}
