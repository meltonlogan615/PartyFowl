//
//  LocationButtonsView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class LocationButtonsView: UIView {
  var orderOnlineButton: ActionButton!
  var grubHubButton: ActionButton!
  var buttonStack: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    layoutButtons()
    translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LocationButtonsView {
  private func layoutButtons() {
    orderOnlineButton = ActionButton(titled: "ORDER NOW - PARTYFOWL.COM")
    orderOnlineButton.translatesAutoresizingMaskIntoConstraints = false

    grubHubButton = ActionButton(titled: "ORDER NOW - GRUBHUB")
    grubHubButton.translatesAutoresizingMaskIntoConstraints = false

    buttonStack = UIStackView(arrangedSubviews: [orderOnlineButton, grubHubButton])
    buttonStack.translatesAutoresizingMaskIntoConstraints = false
    buttonStack.axis = .vertical
    buttonStack.spacing = 16
    addSubview(buttonStack)
    NSLayoutConstraint.activate([
      buttonStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
