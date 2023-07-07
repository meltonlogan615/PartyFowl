//
//  StepperRow.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/5/23.
//

import UIKit

class StepperRow: UIView {
  var optionLabel: UILabel!
  var countLabel: UILabel!
  var stepper: UIStepper!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleRow()
    layoutRow()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension StepperRow {
  private func styleRow() {
    optionLabel = UILabel()
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionLabel.font = .preferredFont(forTextStyle: .body)

    countLabel = UILabel()
    countLabel.translatesAutoresizingMaskIntoConstraints = false
    countLabel.font = .preferredFont(forTextStyle: .body)
    countLabel.text = "0"

    stepper = UIStepper()
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.value = 0
    stepper.minimumValue = 0
    stepper.stepValue = 1
  }

  private func layoutRow() {
    addSubview(optionLabel)
    NSLayoutConstraint.activate([
      optionLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      optionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
      bottomAnchor.constraint(equalToSystemSpacingBelow: optionLabel.bottomAnchor, multiplier: 1)
    ])

    addSubview(stepper)
    NSLayoutConstraint.activate([
      stepper.topAnchor.constraint(equalTo: optionLabel.topAnchor),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stepper.trailingAnchor, multiplier: 2),
      stepper.bottomAnchor.constraint(equalTo: optionLabel.bottomAnchor)
    ])

    addSubview(countLabel)
    NSLayoutConstraint.activate([
      countLabel.topAnchor.constraint(equalTo: optionLabel.topAnchor),
      stepper.leadingAnchor.constraint(equalToSystemSpacingAfter: countLabel.trailingAnchor, multiplier: 2),
      countLabel.bottomAnchor.constraint(equalTo: optionLabel.bottomAnchor)
    ])
  }
}
