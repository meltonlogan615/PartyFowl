//
//  OrderCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/18/23.
//

import UIKit

class OrderCell: UITableViewCell {
  static let reuseID = "orderCell"
  var itemLabel: UILabel!
  var descriptionLabel: UILabel!
  var priceLabel: UILabel!
  var addButton: UIImageView!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: OrderCell.reuseID)
    styleCell()
    layoutCell()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OrderCell {
  private func styleCell() {
    itemLabel = UILabel()
    itemLabel.translatesAutoresizingMaskIntoConstraints = false
    itemLabel.font = .preferredFont(forTextStyle: .headline)
    itemLabel.numberOfLines = 2

    descriptionLabel = UILabel()
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
    descriptionLabel.numberOfLines = 2

    priceLabel = UILabel()
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    priceLabel.font = .preferredFont(forTextStyle: .subheadline)

    addButton = UIImageView()
    addButton.translatesAutoresizingMaskIntoConstraints = false
    addButton.image = UIImage(systemName: "plus")
  }

  private func layoutCell() {
    let topStack: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [itemLabel, priceLabel])
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.axis = .horizontal
      stack.spacing = 8
      stack.distribution = .equalSpacing
      return stack
    }()

    let leftStack: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [topStack, descriptionLabel])
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.axis = .vertical
      stack.spacing = 8
      stack.distribution = .equalSpacing
      return stack
    }()

    contentView.addSubview(leftStack)
    NSLayoutConstraint.activate([
      leftStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
      leftStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: leftStack.bottomAnchor, multiplier: 2)
    ])

    contentView.addSubview(addButton)
    NSLayoutConstraint.activate([
      addButton.widthAnchor.constraint(equalToConstant: 24),
      addButton.heightAnchor.constraint(equalToConstant: 24),
      addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      addButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leftStack.trailingAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: addButton.trailingAnchor, multiplier: 1)
    ])
  }
}
