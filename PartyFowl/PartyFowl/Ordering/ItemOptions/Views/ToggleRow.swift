//
//  OptionRow.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/5/23.
//

import UIKit

class ToggleRow: UIView {
  var optionLabel: UILabel!
  var toggle: UISwitch!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleRow()
    layoutRow()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ToggleRow {
  private func styleRow() {
    optionLabel = UILabel()
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionLabel.font = .preferredFont(forTextStyle: .body)

    toggle = UISwitch()
    toggle.translatesAutoresizingMaskIntoConstraints = false
  }

  private func layoutRow() {
    addSubview(optionLabel)
    NSLayoutConstraint.activate([
      optionLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      optionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
      bottomAnchor.constraint(equalToSystemSpacingBelow: optionLabel.bottomAnchor, multiplier: 1)
    ])

    addSubview(toggle)
    NSLayoutConstraint.activate([
      toggle.topAnchor.constraint(equalTo: optionLabel.topAnchor),
      trailingAnchor.constraint(equalToSystemSpacingAfter: toggle.trailingAnchor, multiplier: 2),
      toggle.bottomAnchor.constraint(equalTo: optionLabel.bottomAnchor)
    ])
  }
}
