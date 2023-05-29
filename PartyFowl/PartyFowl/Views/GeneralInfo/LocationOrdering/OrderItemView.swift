//
//  OrderItemView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/28/23.
//

import UIKit

class OrderItemView: UIView {

  var itemLabel: UILabel!
  var descriptionLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleItemView()
    layoutItemView()
  }

  required init?(coder: NSCoder) {
    fatalError("Ain't no coder coding")
  }
}

extension OrderItemView {
  private func styleItemView() {
    itemLabel = UILabel()
    itemLabel.translatesAutoresizingMaskIntoConstraints = false
    itemLabel.font = .preferredFont(forTextStyle: .largeTitle)
    itemLabel.numberOfLines = 2
    itemLabel.textAlignment = .center

    descriptionLabel = UILabel()
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
    descriptionLabel.numberOfLines = 0
  }

  private func layoutItemView() {
    addSubview(itemLabel)
    NSLayoutConstraint.activate([
      itemLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      itemLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      trailingAnchor.constraint(equalToSystemSpacingAfter: itemLabel.trailingAnchor, multiplier: 2)
    ])

    addSubview(descriptionLabel)
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: itemLabel.bottomAnchor, multiplier: 2),
      descriptionLabel.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: itemLabel.trailingAnchor)
    ])
  }
}
